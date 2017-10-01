# Overview

This document describes how to do development running in docker.
It's not yet complete

## Docker Install
If you're not already running docker, you might be happier with [macOS_Development.md].

But for the brave: https://docs.docker.com/engine/installation/

Follow dockers instructions so the `docker` and `docker-compose` commands are available in your shell of choice.

## Getting the Code

Clone the repository: `git clone https://github.com/PuzzledPint/puzzledpint.com.git` but note that your URL may be different if you’re a contributor with ssh access.

## Starting the container

From the repository, run `docker-compose up -d` to start the website and postgres.

Enter the container with `docker exec -ti puzzledpintcom_pint_1 bash`

Run `./bin/setup` to create database tables

Run `rake db:seed:user` to create a gc login

Start the server by running `rails server -b 0.0.0.0`

## Launch the Webapp

- Open a browser to <http://localhost:3000> and look for the pintglass logo
- Open a browser to <http://localhost:3000/game_control> and log in

