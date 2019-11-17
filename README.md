# Description and specification

[Fullstack Challenge](http://bit.ly/fullstack_challenge)

# Requirements

  - Ruby 2.6.5
  - PostgreSQL 11 or higher
  - Redis 4.0.9 or higher
  - *nix
# Deploy
```sh
$ gem install bundler --version=2.0.2
$ bundle
$ rake db:create
$ rake db:migrate
$ bundle exec sidekiq -q default -q mailers
$ bundle exec mailcatcher
```
# Test
```sh
$ rspec
```
# Run
```sh
$ rails s -p 3000
```
# Documentation
http://localhost:3000/apipie
# [EOF]
