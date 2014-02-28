## v2.1.0
* Updated dependencies
* Made the Gemfile a bit less restricive by locking minor version and allowing patch updates.
* Removed rakefile - Guard runs all tests in userland.
* Added Thorfile - thor-scmversion. Will possibly add tests in to thorfile for easier CI setup in the future.
* Moved metadata version to external VERSION file.
* Allow Gemfile.lock to be commited for --deployment mode bundler.
* Check for omnibus/gem chef and use the already installed version. If you have no version of chef installed, this tells you to install it.

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
