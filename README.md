Puzzled Pint
============

[![Circle CI](https://img.shields.io/circleci/project/PuzzledPint/puzzledpint.com.svg?style=plastic)](https://circleci.com/gh/PuzzledPint/puzzledpint.com)
[![Code Climate](https://codeclimate.com/github/PuzzledPint/puzzledpint.com/badges/gpa.svg)](https://codeclimate.com/github/PuzzledPint/puzzledpint.com)
[![Stories in Progress](https://badge.waffle.io/PuzzledPint/puzzledpint.com.svg?label=In%20Progress&title=in%20progress)](http://waffle.io/PuzzledPint/puzzledpint.com)

About
-----

This is the app for the next-gen [PuzzledPint.com](http://puzzledpint.com) website engine.

The code can be found at <https://github.com/puzzledpint/puzzledpint.com>

It is copyright 2016, licensed under the [GNU General Public License version 3](LICENSING.md).

The ultimate goal of this project is to build a turn-key website for running [Puzzled Pint](http://www.puzzledpint.com/), a monthly puzzling event that's held on the same night in more than 40 cities around the world. The current incarnation allows for the hosts (the Game Control, or GC) of each city to independently enter their location information, which then gets displayed when puzzlers solve that month's location puzzle. There are plenty of additional features to build out.

Prerequisites
-------------

This project is written in Ruby 2.3 and Rails 4.2. It requires a PostgreSQL database. Other dependencies are loaded as Ruby gems via Bundler.

Installation
------------

This project can be deployed to Heroku.

Contributing
-------------

There are many ways you can help with this project, from writing code to writing documentation. A good place to start might be to look at the [issues list](https://github.com/puzzledpint/puzzledpint.com/issues). [Major features we are looking to implement](https://github.com/puzzledpint/puzzledpint.com/issues?q=is%3Aopen+is%3Aissue+label%3Afeature) include:

- Collecting standings from local GC.
- A stats front-end to view those standings.
- Roster of cities, GC bios, and social media links.
- Player RSVP.
- Twitter/Facebook notification.
- S3 integration.
- Puzzle asset management for playtesting and release.

Please see [`CONTRIBUTING.md`](doc/CONTRIBUTING.md) for details. All are welcome, but please be sure to check the [code of conduct](doc/CODE_OF_CONDUCT.md).

If you are developing on a Mac, consult [macOS_Development.md](doc/macOS_Development.md) for instructions on setting up your environment.


