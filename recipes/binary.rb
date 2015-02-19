supported_versions = node['mecab']['support'].keys
version = node['mecab']['version']
mecab_dl_site = node['dl_site']['mecab']

src_filename_noext = "mecab-#{version}"
src_filename = "#{src_filename_noext}.tar.gz"
src_filepath = "#{mecab_dl_site}#{src_filename}"
copy_to = "#{Chef::Config[:file_cache_path]}/#{src_filename}"

checksum = node['mecab']['support'][version]['checksum']
checksum_type = node['mecab']['support'][version]['checksum_type']

configure_cmd = %W{
  ./configure
  #{node['mecab']['conf']['prefix'] ? "--prefix=#{node['mecab']['conf']['prefix']}" : ""}
  #{node['mecab']['conf']['charset'] ? "--with-charset=#{node['mecab']['conf']['charset']}" : ""}
  #{node['mecab']['conf']['utf8-only'] ? '--enable-utf8-only' : ''}
}.join(' ')

if not supported_versions.include?(version) then
  Chef::Application.fatal!("#{recipe_name} doesn't support the version #{version}")
end

remote_file 'download MeCab source' do
  path copy_to
  source src_filepath
  mode '0644'
  not_if 'which mecab'
  not_if { no_need_to_copy?(checksum_type, copy_to, checksum) }
  notifies :run, 'execute[make && make install MeCab]', :immediately
end

execute 'make && make install MeCab' do
  action :nothing
  cwd Chef::Config[:file_cache_path]
  command <<-EOD
              tar -zxf #{src_filename}
              cd #{src_filename_noext}
              #{configure_cmd}
              make
              make check
              make install
            EOD
  notifies :run, 'ruby_block[edit ld.so.conf]', :immediately
end

# FIXME: Edting configuration file is not the chef way.
ruby_block 'edit ld.so.conf' do
  action :nothing
  block do
    p = "#{node['mecab']['conf']['prefix']}/lib"
    fe = Chef::Util::FileEdit.new('/etc/ld.so.conf')
    fe.insert_line_if_no_match(/p/, p)
    fe.write_file
  end
  not_if "ldconfig -p | grep #{node['mecab']['conf']['prefix']}/local/lib"
  not_if { !platform_family?('debian', 'rhel') }
  notifies :run, 'execute[ldconfig]', :immediately
end

execute 'ldconfig' do
  command 'ldconfig'
  action :nothing
end
