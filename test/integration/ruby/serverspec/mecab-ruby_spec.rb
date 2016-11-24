require 'spec_helper'

mecab_version_cmd = <<EOD
bash -lc "ruby -e \\"require 'MeCab'; print MeCab::Model.version\\""
EOD

describe command(mecab_version_cmd) do
  its(:stdout) { should match (/\d\.\d{3}/) }
end
