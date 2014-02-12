##kitchen-cabinet##
----

About
=====

Inspiration for this gem was taken from `meez` - [Found here]{https://github.com/paulczar/meez}. It creates an opinionated cookbook complete with testing suites.

Once `cabinet` has finished running, you will have a new cookbook complete with an initialized git repo, chefspec, serverspec, strainer, test-kitchen, guard (with notifications via inotify/fsevent/guard-terminal-notify), rubocop, foodcritic, berkshelf, and stove.

It will automatically create a Gemfile for you with different groups set up for development, testing, etc:

`````` ruby
source 'https://rubygems.org'

gem 'berkshelf',  '~> 2.0.13'

group :unit do
  gem 'foodcritic', '~> 3.0'
  gem 'rubocop',  '~> 0.18.0'
  gem 'chefspec', '~> 3.2.0'
end

group :integration do
  gem 'test-kitchen', '~> 1.1'
  gem 'kitchen-vagrant'
end

group :release do
  gem 'stove', '~> 1.1.2'
end

group :development do
  gem 'strainer', '~> 3.3.0'
  gem 'serverspec', '~> 0.14.2'
  gem 'guard', '~> 1.8'
  gem 'guard-rubocop', '~> 0.2'
  gem 'guard-foodcritic', '~> 1.0'
  gem 'guard-kitchen', '~> 0.0'
  gem 'guard-rspec', '~> 3.0'
  gem 'rb-fsevent', :require => false
  gem 'rb-inotify', :require => false
  gem 'terminal-notifier-guard', :require => false
end
``````

The goal of this project is to prevent any manual setup of the cookbook environment. We used to copy Gemfiles and other configurations from cookbook to cookbook, making changes as needed. That quickly gets messy as things get out of date! With `cabinet`, every project starts with the same templated base.

Install
=======

`gem install kitchen-cabinet`

Usage
=====

```
Usage: cabinet [options] <cookbook name>

Options
    -o, --cookbook-path USERNAME     The directory where the cookbook will be created
    -C, --copyright COPYRIGHT_HOLDER The  name  of  the  copyright holder.
    -I, --license LICENSE            The type of license under which a cookbook is distributed: apachev2, gplv2, gplv3, mit, or none (default).
    -m, --email EMAIL                The  email  address  for the individual who maintains the cookbook.
    -h, --help                       help
```

### Example

`````` bash
➜  ~  cabinet --cookbook-path ~/Desktop -C Taylor Price -I apachev2 -m tprice@onehealth.com test-cookbook
* Initializing chef
** Creating cookbook test-cookbook
** Creating README for cookbook: test-cookbook
** Creating CHANGELOG for cookbook: test-cookbook
** Creating metadata for cookbook: test-cookbook
	Rewriting metadata.rb
	Rewriting recipes/default.rb
* Initializing knife
* Initializing git
* Initializing berkshelf
      create  Desktop/test-cookbook/Berksfile
      create  Desktop/test-cookbook/Thorfile
      create  Desktop/test-cookbook/.gitignore
         run  git init from "./Desktop/test-cookbook"
      create  Desktop/test-cookbook/Gemfile
* Initializing kitchen
      create  .kitchen.yml
      append  Thorfile
      create  test/integration/default
      append  Gemfile
      append  Gemfile
You must run `bundle install' to fetch any new gems.
* Initializing guard
* Initializing chefspec
* Initializing strainer
* Initializing rubocop
* Initializing foodcritic
* Initializing serverspec
* Initializing stove
this is the test-cookbook cookbook.
Cookbook test-cookbook created successfully
Next steps...
  $ cd /Users/tprice/Desktop/test-cookbook
  $ bundle install
  $ bundle exec berks install
  $ bundle exec strainer test

➜  cd ~/Desktop/test-cookbook
➜  bundle install
Fetching gem metadata from https://rubygems.org/
Fetching additional metadata from https://rubygems.org/
Resolving dependencies...
...
...
Your bundle is complete!
➜  bundle exec berks install
Using test (0.1.0) from metadata
➜  bundle exec strainer test
...
...
``````

And so on!

Contributing
-------------------
1. Fork this repo!
2. Submit a pull request!
3. ???
4. Profit!

In an effort to make this easier to update/maintain I have made all of the config files into seperate .eruby files (for erubis). That way tool versions can be bumped easily and variables/templating can be added to those config files very easily.

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