kitchen-cabinet
===============
[![Build Status](https://travis-ci.org/onehealth/kitchen-cabinet.png)](https://travis-ci.org/onehealth/kitchen-cabinet) [![Dependency Status](https://gemnasium.com/onehealth/kitchen-cabinet.png)](https://gemnasium.com/onehealth/kitchen-cabinet) [![Code Climate](https://codeclimate.com/github/onehealth/kitchen-cabinet.png)](https://codeclimate.com/github/onehealth/kitchen-cabinet) [![Gem Version](https://badge.fury.io/rb/kitchen-cabinet.png)](http://badge.fury.io/rb/kitchen-cabinet)

About
-----

Inspiration for this gem was taken from [meez](https://github.com/paulczar/meez). It creates an opinionated cookbook complete with testing suites.

Once `cabinet` has finished running, you will have a new cookbook complete with an initialized git repo, chefspec, serverspec, test-kitchen, guard (with notifications via inotify/fsevent/terminal-notifier), rubocop, foodcritic, berkshelf, and stove.

It will automatically create a Gemfile for you with different groups set up for development, testing, etc:

`````` ruby
source 'https://rubygems.org'

gem 'berkshelf', '~> 2.0.14'

group :unit do
  gem 'foodcritic',       '~> 3.0'
  gem 'rubocop',          '~> 0.18.0'
  gem 'chefspec',         '~> 3.2.0'
end

group :integration do
  gem 'test-kitchen',    '~> 1.2'
  gem 'kitchen-vagrant'
end

group :release do
  gem 'stove', '~> 1.1'
  gem 'rspec_junit_formatter'
  gem 'rubocop-checkstyle_formatter'
end

group :development do
  gem 'rake',			  '~> 10.1'
  gem 'serverspec',       '~> 0.14.2'
  gem 'guard',            '~> 1.8'
  gem 'guard-rubocop',    '~> 0.2'
  gem 'guard-foodcritic', '~> 1.0'
  gem 'guard-kitchen',    '~> 0.0'
  gem 'guard-rspec',      '~> 3.0'
  gem 'rb-fsevent', :require => false
  gem 'rb-inotify', :require => false
  gem 'terminal-notifier-guard', :require => false
end
``````

* The versions in the README may get out of date. Please look in lib/kitchen-cabinet/templates for the up-to-date Gemfile.

The goal of this project is to prevent any manual setup of the cookbook environment. We used to copy Gemfiles and other configurations from cookbook to cookbook, making changes as needed. That quickly gets messy as things get out of date! With `cabinet`, every project starts with the same templated base.

Install
=======

`gem install kitchen-cabinet`

* In order to accomodate the most different use types, `kitchen-cabinet` supports omnibus and gem installations of chef. As such, it does not manage chef installation for you. Please install chef yourself before trying to use `kitchen-cabinet`.

Usage
=====

```
Usage: cabinet [options] <cookbook name>

Options
    -o, --cookbook-path PATH         The directory where the cookbook will be created.
    -C, --copyright COPYRIGHT_HOLDER The  name  of  the  copyright holder.
    -I, --license LICENSE            The type of license under which a cookbook is distributed: apachev2, gplv2, gplv3, mit, or none (default).
    -m, --email EMAIL                The  email  address  for the individual who maintains the cookbook.
    -u, --update                     Update the Gemfile, Chefignore, Guardfile, rubocop.yml, and the Rakefile.
    -h, --help                       help
```

If you do not specify any options, `cabinet` will assume you want the defaults - it will read these from your knife.rb if available.

If you do not specify `-o` for a path to the directory you want to create your cookbook in, `cabinet` will create the new cookbook in your current directory. Likewise, if you say `cabinet update`, it will look in your current directory (which should be inside the cookbook) for files to update.

### Example

`````` bash
➜  ~  cabinet --cookbook-path ~/Desktop -C Taylor Price -I apachev2 -m tprice@onehealth.com test
* Initializing chef
** Creating cookbook test
** Creating README for cookbook: test
** Creating CHANGELOG for cookbook: test
** Creating metadata for cookbook: test
	Rewriting metadata.rb
	Rewriting recipes/default.rb
* Initializing git
* Initializing berkshelf
      create  /Users/tprice/Desktop/test/Berksfile
      create  /Users/tprice/Desktop/test/Thorfile
      create  /Users/tprice/Desktop/test/.gitignore
         run  git init from "/Users/tprice/Desktop/test"
      create  /Users/tprice/Desktop/test/Gemfile
* Initializing kitchen
      create  .kitchen.yml
      append  Thorfile
      create  test/integration/default
      append  Gemfile
      append  Gemfile
You must run `bundle install' to fetch any new gems.
* Initializing chefspec
* Initializing serverspec
this is the test cookbook.
Cookbook test created successfully
Next steps...
  $ cd /Users/tprice/Desktop/test
  $ bundle install
  $ bundle exec berks install
  $ bundle exec rake -T
  ...
``````

And so on!

Contributing
-------------------
Please look at the CONTRIBUTING.md file for contribution guidelines.

License and Authors
-------------------

Authors:
========

Taylor Price - tprice@onehealth.com 

License:
========

Copyright 2014 OneHealth Solutions, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
