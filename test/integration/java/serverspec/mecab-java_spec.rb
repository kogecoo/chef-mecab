require 'spec_helper'

# FIXME: serverspec cannot touch attribute values in a chef cookbook.
mecab_sdk = "/usr/local/bin/mecab-java"
workdir = "/tmp/serverspec-mecab-java"
classname = "Check"

check_mecab_version_cmd = <<-EOD
cd #{workdir};
cp -r #{mecab_sdk}/* .;
echo '
import org.chasen.mecab.Model;

public class #{classname} {
  static {
    System.loadLibrary("MeCab");
  }

  public static void main(String[] args){
    System.out.println(Model.version());
  }
}
' > #{classname}.java;
javac #{classname}.java -classpath .;
java -Djava.library.path=. #{classname};
rm -rf Check.*;
EOD


describe command(check_mecab_version_cmd), :sudo => true do
  its(:stdout) { should match (/\d\.\d{3}/) }
end
