require 'spec_helper'

prefix     = "/usr/local"
version    = "0.996"
dictionary = "naistjdic"
dic_path  = "#{prefix}/lib/mecab/dic/#{dictionary}/sys.dic"

describe command('which mecab') do
  its(:stdout) { should match "#{prefix}/bin/mecab" }
end

describe file(dic_path) do
  it { should be_file }
end

describe command('mecab -v') do
  its(:stdout) { should match "#{version}" }
end

describe command('mecab -D') do
  its(:stdout) { should match (/filename:\t#{dic_path}\nversion:\t[0-9]+\ncharset:\tutf8/) }
end
