default["dl_site"] = {
  "mecab"     => "http://mecab.googlecode.com/files/",
  "unidic"    => "http://sourceforge.jp/frs/redir.php?m=jaist&f=%2Funidic%2F58338%2F",
  "naistjdic" => "http://sourceforge.jp/frs/redir.php?m=iij&f=%2Fnaist-jdic%2F53500%2F"
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

default["naistjdic"] = {
  "version" => "0.6.3b-20111013",
  "support" => {
    "0.6.3b-20111013" => { "checksum" => "52238fb14d949e49a65a9dbc1f7e382c", "checksum_type" => :MD5 },
    "0.6.3-20100801"  => { "checksum" => "30af2251331b9d6141748caf033821e3", "checksum_type" => :MD5 },
    "0.6.2-20100208"  => { "checksum" => "01d806a4682da610a051480d87a2c7c2", "checksum_type" => :MD5 },
    "0.6.1-20090630"  => { "checksum" => "1a0ea25002dcf1e4b925a88e10e7d3eb", "checksum_type" => :MD5 },
    "0.6.0-20090616"  => { "checksum" => "1babf0f548b038af9d2206e6a1615a83", "checksum_type" => :MD5 },
    "0.5.0-20090512"  => { "checksum" => "90398f6be899178afea669928d5c5b70", "checksum_type" => :MD5 }
  }
}
