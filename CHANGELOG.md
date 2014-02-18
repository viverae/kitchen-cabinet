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
