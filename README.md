[![Build Status](https://travis-ci.org/octopusinvitro/railsblog-spike.svg?branch=master)](https://travis-ci.org/octopusinvitro/railsblog-spike)
[![build status](https://gitlab.com/octopusinvitro/railsblog-spike/badges/master/build.svg)](https://gitlab.com/octopusinvitro/railsblog-spike/commits/master)
[![Coverage Status](https://coveralls.io/repos/github/octopusinvitro/railsblog-spike/badge.svg?branch=master)](https://coveralls.io/github/octopusinvitro/railsblog-spike?branch=master)
[![Dependency status](https://badges.depfu.com/badges/13769679d7e545d6654b5c9f2918255f/overview.svg)](https://depfu.com/github/octopusinvitro/railsblog-spike?project=Bundler)
[![Maintainability](https://api.codeclimate.com/v1/badges/cb1f4cf54cf53ec62381/maintainability)](https://codeclimate.com/github/octopusinvitro/railsblog-spike/maintainability)

# README

This is an app to simulate a blog where you have to log in with an admin account in order to perform CRUD operations on the database.

You can access the app here https://railstwittersample.herokuapp.com

![Screenshot1](screenshot.png)


## How to setup the project

This project uses Sqlite. Be sure you have it installed in your system before installing the gems. If you don't, type:

```bash
sudo apt-get install sqlite3 libsqlite3-dev
```

The install all the gems:

```bash
bundle install
```


## Running the tests

Make sure all the migrations have run:

```bash
bundle exec rake db:setup db:migrate RAILS_ENV=test
```

And then

```bash
bundle exec rake
```

To run the test suite in pride mode type `bundle exec rake test TESTOPTS='--pride'`



## Running the app

Make sure all the migrations have run:

```bash
bundle exec rake db:setup db:migrate RAILS_ENV=development
```

And then

```bash
bundle exec rails s
```

Then go to <http://localhost:3000/>


To start the app in production do `bundle exec rails s -e production`


## Installing the Heroku cli


You can install the heroku cli as a gem, but it is better to [install it in your system](https://devcenter.heroku.com/articles/heroku-cli) so that it is available to you for any language and not only in Ruby.


## Pushing to Heroku

Pushing to heroku will deploy the application.

Make sure you have an account in Heroku and log in:

```bash
heroku login
> Enter your Heroku credentials:
> Email: user@example.com
> Password: ***********
> Logged in as user@example.com
```

Create the app if it doesn't exist yet

```bash
heroku create yourapp
```

Make sure that the app is in your remotes

```bash
heroku git:remote -a yourapp
```

Then push

```bash
git push heroku master
```


## License

[![License](https://img.shields.io/badge/gnu-license-green.svg?style=flat)](https://opensource.org/licenses/GPL-2.0)
GNU License
