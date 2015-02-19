default["dl_site"] = {
  "mecab"  => "http://mecab.googlecode.com/files/",
  "unidic" => "http://sourceforge.jp/frs/redir.php?m=jaist&f=%2Funidic%2F58338%2F"
}

default["mecab"] = {
  "version" => "0.996",
  "support" => {
    "0.996" => { "checksum" => "15baca0983a61c1a49cffd4a919463a0a39ef127", "checksum_type" => :SHA1 },
    "0.994" => { "checksum" => "9d283f9d243b1a58a2845ff60797c11a88b1f926", "checksum_type" => :SHA1 }
  },
  "conf" => {
    "prefix"   => "/usr/local",
    "charset"  => "utf8",
    "utf8-only" => true
  },
  "dictionary" => "ipadic"
}

default["ipadic"] = {
  "version" => "2.7.0-20070801",
  "support" => {
    "2.7.0-20070801" => { "checksum" => "0d9d021853ba4bb4adfa782ea450e55bfe1a229b", "checksum_type" => :SHA1 }
  }
}

default["jumandic"] = {
  "version" => "7.0-20130310",
  "support" => {
    "7.0-20130310" => { "checksum" => "db419d23b955bfaca1e2eea421e3ffa3a1fd3f72", "checksum_type" => :SHA1 }
  }
}

default["unidic"] = {
  "version" => "2.1.2",
  "support" => {
    "2.1.2" => { "checksum" => "547ce5824429a022d6fe368af39a106c", "checksum_type" => :MD5 },
    "2.1.1" => { "checksum" => "9609881ee9c0a1d2bbc59447077863bc", "checksum_type" => :MD5 }
  }
}
