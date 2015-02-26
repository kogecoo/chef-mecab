MeCab Chef Cookbook
=======================

[![Circle CI](https://circleci.com/gh/kogecoo/chef-mecab.svg?style=svg)](https://circleci.com/gh/kogecoo/chef-mecab)

Installs MeCab and its well-known dictionary.

Platforms
---------
The following platforms and versions are tested and supported using test-kitchen

* Ubuntu 14.04
* Debian 7.8
* CentOS 7.0

Attributes
-----
see [source](attributes/default.rb)

Recipes
----------
* `recipe[mecab::ipadic]` - Install MeCab and IPA Dictionary. (default)
* `recipe[mecab::jumandic]` - Install MeCab and Juman Dictionary.
* `recipe[mecab::unidic]` - Install MeCab and Unidic Dictionary.
* `recipe[mecab::naistjdic]` - Install MeCab and NAIST-JDIC Dictionary.

Usage
-----
Just include `mecab` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[mecab]"
  ]
}
```

Misc
----
[GitHub Repository](http://github.com/kogecoo/chef-mecab)

License and Author
-------------------
- Author: [kogecoo](http://github.com/kogecoo)
- License: Apache License, Version 2.0 (see [LICENSE](LICENSE))
