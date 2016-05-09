# Contributing

First of all, thank you for volunteering your time to contribute to this project.

We love pull requests from everyone. By participating in this project, you agree
to abide by the [code of conduct].

[code of conduct]: CODE_OF_CONDUCT.md
## How to contribute
1. Fork the repo.
2. Make your change.
3. Test your change. Make sure all of the tests pass by running `./bin/rspec`
4. Make sure your change matches our style guide by running `bundle exec rubocop`
5. Write a [good commit message][commit].
6. Include the github issue number(s) that this branch resolves. [More Info](https://help.github.com/articles/closing-issues-via-commit-messages/)
7. Push to your fork.
8. [Submit a pull request][pr].
9. If [Hound] catches style violations, fix them.

Wait for us.  We are also volunteers. We will get back to you as soon as possible.
We may suggest changes.

[commit]: http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html
[pr]: https://github.com/PuzzledPint/puzzledpint.com/compare/
[hound]: https://houndci.com


## Setting up local development
### Install dependencies
1. Install postgresql: `brew install postgresql`
2. [Follow these instructions](https://rvm.io) to install `rvm`.
3. Install ruby 2.3.0. `rvm install ruby-2.3.0`
4. Make a `tmp` directory. `mkdir tmp`

### Initial setup
First, start your postgresql server.

    pg_ctl pg_ctl -D tmp/database/ -l tmp/pg_logfile start

Run this setup script to set up your machine:

    ./bin/setup

Everything should be good! Make sure the tests pass just to be sure.

    ./bin/rspec


### Start up
Start the rails server with:

    bin/rails server

You should see the interesting part of the website at [http://localhost:3000/game_control](http://localhost:3000/game_control). Well, you would, if you could log in. Let's fix that.

1. Launch an interactive rails console with `bin/rails c`
2. Run the following lines of ruby code. Feel free to sub whatever email and password you'd like.


    user = Admin.create(email:"ema@example.com", password:"password", full_name:"Ema Nymton")
    user.add_role(:create)
    user.save

That's it! You should be able to log in with that username and password.
