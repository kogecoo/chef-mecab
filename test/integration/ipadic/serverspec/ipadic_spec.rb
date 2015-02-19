require 'spec_helper'

# TODO: find more simple way to test.

#  Since busser-serverspec doesn't provide a feature of accessing chef attributes,
# we need to hardcode following values.
# https://github.com/test-kitchen/busser-serverspec/issues/8

prefix     = "/usr/local"
version    = "0.996"
dictionary = "ipadic"
dic_path  = "#{prefix}/lib/mecab/dic/#{dictionary}/sys.dic"


# the following are duplicated with jumandic_spec.rb and unidic_spec.rb
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
