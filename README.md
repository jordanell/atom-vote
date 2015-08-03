# Atom Vote

A simple voting web application

## Status

[![Circle CI](https://circleci.com/gh/jordanell/atom-vote.svg?style=svg&circle-token=e362bab71fc7813e947d11f8f1a59602f51b1185)](https://circleci.com/gh/jordanell/atom-vote)

## Description

Atom Vote is a simple voting application that can be used via the web or through the
API.

A user creates a question with up to four choices, recieves a public link, then lets
the votes roll in.

## Development

To set up your development environment in OSX follow the directions below.

### Brew Installs

Install Homebrew from https://github.com/mxcl/homebrew or http://brew.sh/

    brew update
    brew install rbenv ruby-build postgresql git apple-gcc42

### Configure Postgres

Ensure you have a `root` user with no password.

Create the following databases:
1. atom_vote_development
2. atom_vote_test

Grant permission on these new databases to the `root` user.

### Ruby Install

    rbenv install 2.2.2
    rbenv rehash

### Clone Repository

    git clone git@github.com:jordanell/atom-vote.git
    cd atom-vote
    rbenv local 2.2.2
    bundle install
    bundle exec rake db:create

### Run the server

    rails server
