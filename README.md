##kitchen-cabinet##
----

About
=====

This gem was born from `meez` - the idea of using a gem to setup a cookbook development environment complete with tests was taken from `meez`. `kitchen-cabinet` is a complete rewrite of the code with some extra goodness added in.



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

License and Authors
-------------------

Authors:
========

Taylor Price - tprice@onehealth.com 

License:
========

Copyright 2014 Taylor Price,  OneHealth Solutions, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.