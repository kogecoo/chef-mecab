require 'spec_helper'

describe command('python -c "import MeCab; print MeCab.Model.version()"') do
  its(:stdout) { should match (/\d\.\d{3}/) }
end
