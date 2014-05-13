## v3.0.1
* Updated Gemfile - newer versions, and the gemfile should be usable for development as well as for CI - make use of `bundle install --without` if you do not want tools like berkshelf/thor-scmversion/etc installed in your system ruby.

## v3.0.0
* kitchen cabinet now shells out for knife, so its compatible with omnibus chef and chefdk
* instead of always specifying dependencies in a gemfile, kitchen-cabinet will now install things like chefspec directly in the embedded ruby of chefdk or omnibus chef (this prevents having to install the gem version of chef on top of your existing setup)
* Less runtime dependencies! There's no need to rely on test-kitchen or berkshelf when I'm just going to replace the generic generated templates with generic generated templates of my own!

## v2.1.1
* Fixed issue where git would create the contents of .git/ in the main cookbook folder.
* Modified Berksfile so that site: opscode is commented out. This should make issues with new cookbook versions accidentally being inserted into your chef server much less common.
* Now your Berksfile.lock files will be committed - we discovered there can be some dependency issues same as with the Gemfile.lock, which we also allow to be comited.
* thor-scmversion is configured to bump patch version unless otherwise specified in your commit.

## v2.1.0
* Updated dependencies
* Made the Gemfile a bit less restricive by locking minor version and allowing patch updates.
* Removed rakefile - Guard runs all tests in userland.
* Added Thorfile - thor-scmversion. Will possibly add tests in to thorfile for easier CI setup in the future.
* Moved metadata version to external VERSION file.
* Allow Gemfile.lock to be commited for --deployment mode bundler.
* Check for omnibus/gem chef and use the already installed version. If you have no version of chef installed, this tells you to install it. Definitely supports Linux/OS X, probably supports Windows as well.
* Uses thor for tests, publishing, and scm-version (mainly for CI). Also includes command to run tests and push to git (note that this does not commit for you).

## v2.0.1
* Fixed `cabinet update` command.
* Vastly simplified bin logic
* Rake still runs tests, but soon it will be used just for releases (Guard runs tests already)

## v2.0.0
* Read knife.rb config for cookbook values if no cli overrides are used
* Uses Rake to execute tests instead of Strainer (Strainer is being phased out)

####Known bugs:
* `cabinet update` does not work.

## v1.2.0:

* Run commands from current directory if not otherwise specified with -o
* Added `cabinet update` to update cookbook the cookbook you are currently in.
* Updated config files (.coverage, JetBrains files to gitignore and chefignore, etc)

## v1.1.1:

* Refactored code
* added -u option to update cookbooks[beta]
* Initial public release
