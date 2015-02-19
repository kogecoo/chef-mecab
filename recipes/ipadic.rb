include_recipe "mecab::binary"

supported_versions = node["ipadic"]["support"].keys
version = node["ipadic"]["version"]

src_filename_noext = "mecab-ipadic-#{version}"
src_filename = "#{src_filename_noext}.tar.gz"
src_filepath = "#{node["dl_site"]["mecab"]}#{src_filename}"
copy_to = "#{Chef::Config[:file_cache_path]}/#{src_filename}"

checksum = node['ipadic']['support'][version]['checksum']
checksum_type = node['ipadic']['support'][version]['checksum_type']

install_path_prefix = node["mecab"]["conf"]["prefix"]
mecabrc_path = "#{install_path_prefix}/etc/mecabrc"

configure_cmd = %W{
  ./configure
  --prefix=#{install_path_prefix}
  --with-charset=#{node["mecab"]["conf"]["charset"]}
}.join(" ")

if not supported_versions.include?(version) then
  Chef::Application.fatal!("This recipe for ipadic doesn't support the version #{version}")
end

remote_file copy_to do
  source src_filepath
  mode "0644"
  notifies :run, 'execute[install ipadic]', :immediately

  # Skip download/make/install if system already has IPADic regardless of its version.
  not_if { ::File.exists?("#{install_path_prefix}/lib/mecab/dic/ipadic") }
  not_if { no_need_to_copy?(checksum_type, copy_to, checksum) }
end

execute "install ipadic" do
  action :nothing
  cwd Chef::Config[:file_cache_path]
  command <<-EOD
    tar -zxf #{src_filename}
    cd #{src_filename_noext}
    #{configure_cmd}
    make
    make install
  EOD
  notifies :run, 'ruby_block[edit dicdir path in mecabrc]', :immediately
end

# FIXME: Edting configuration file is not the chef way.
ruby_block 'edit dicdir path in mecabrc' do
  action :nothing
  block do
    fe = Chef::Util::FileEdit.new(mecabrc_path)
    fe.search_file_replace_line(/^dicdir = /, "dicdir = #{install_path_prefix}/lib/mecab/dic/ipadic")
    fe.write_file
  end
  not_if { ::File.open(mecabrc_path).read() =~ /dicdir\s+=\s+#{install_path_prefix}\/lib\/mecab\/dic\/ipadic/ }
end
