# Contributing

First of all, thank you for volunteering your time to contribute to this project.

We love pull requests from everyone. By participating in this project, you agree
to abide by the [code of conduct].

[code of conduct]: CODE_OF_CONDUCT.md

For Mac-specific instructions, be sure to read [`macOS_Development.md`](macOS_Development.md).

Fork the repo.

Set up your machine:

    ./bin/setup

Make sure the tests pass:

    ./bin/rspec

Make your change.

We are using a [slightly modified version] of the [Ruby Style Guide]. Run
[rubocop] locally to analyze your code and make changes it suggests.

    bundle exec rubocop

[slightly modified version]: https://github.com/PuzzledPint/puzzledpint.com/blob/master/.rubocop.yml
[Ruby Style Guide]: https://github.com/bbatsov/ruby-style-guide
[rubocop]: https://github.com/bbatsov/rubocop

Write tests.  Make the tests pass:

[style]: https://github.com/thoughtbot/guides/tree/master/style

    ./bin/rspec

Write a [good commit message][commit]. 
Include the git hub issue number(s) that this branch resolves. [More Info](https://help.github.com/articles/closing-issues-via-commit-messages/)

Push to your fork.

[Submit a pull request][pr].

[commit]: http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html
[pr]: https://github.com/PuzzledPint/puzzledpint.com/compare/

If [Hound] catches style violations, fix them.akes.

[hound]: https://houndci.com

Wait for us.  We are also volunteers. We will get back to you as soon as possible.
We may suggest changes.
