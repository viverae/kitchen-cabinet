# Contributing to OneHealth Projects

We are glad you want to contribute to OneHealth projects! The first
step is the desire to improve the project.

## Quick-contribute

* Create an issue on the github [issue tracker](https://github.com/onehealth/kitchen-cabinet/issues)
* Link to your patch as a rebased git branch or pull request from the ticket

We regularly review contributions and will get back to you if we have
any suggestions or concerns.

### Branches and Commits

You should submit your patch as a git branch named after the change.

It is a best practice to have your commit message have a _summary
line_, followed by an empty line and then a brief description of 
the commit. This also helps other contributors understand the 
purpose of changes to the code.

Remember that not all users use ruby in the same way or on the same
operating systems as you, so it is helpful to be clear about your use
case and change so they can understand it even when it doesn't apply
to them.

### Github and Pull Requests

We don't require you to use Github, and we will even take patch diffs
attached to tickets on the issue tracker. However Github has a lot of
convenient features, such as being able to see a diff of changes
between a pull request and the main repository quickly without
downloading the branch.

## Functional and Unit Tests

If any don't pass, investigate them before submitting your patch.

Any new feature should have unit tests included with the patch with
good code coverage to help protect it from future changes. Similarly,
patches that fix a bug or regression should have a _regression test_.
Simply put, this is a test that would fail without your patch but
passes with it. The goal is to ensure this bug doesn't regress in the
future. Consider a regular expression that doesn't match a certain
pattern that it should, so you provide a patch and a test to ensure
that the part of the code that uses this regular expression works as
expected. Later another contributor may modify this regular expression
in a way that breaks your use cases. The test you wrote will fail,
signalling to them to research your ticket and use case and accounting
for it.

Please do ensure that your changes do not break or modify behavior for
other platforms supported by the gem. For example if your changes
are for Debian, make sure that they do not break on CentOS.

Please do not modify the version number, the maintainer will select 
the appropriate version based on the release cycle information above.

Please do not update the CHANGELOG.md for a new version. Not all
changes to a gem may be merged and released in the same versions.
OneHealth will update the CHANGELOG.md when releasing a new version of
the gem.
