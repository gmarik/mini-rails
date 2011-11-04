## About

[mini-rails](http://github.com/gmarik/mini-rails) is a single-file-rails-app project

## Todo

[ ] Better defaults
[/] Sinatra DSL
  [X] block dsl in router
  [ ] block dsl behaviours like controller action
    [ ] render
    [ ] redirect
    [ ] ....
  [ ] jsonp helpers?
  [ ] short helpers
    (jsonp,404,text,haml etc.)
    lets provide these as controller helpers, so they become backwards compatible
[ ] Guides
[ ] Example App, 1 branch per refactor
[ ] Encourage fast tests

## Future

[ ] Async
  [ ] long connections
  [ ] large non-blocking fileuploads

## Run it

- `cd mini-rails; rackup`
- `curl http://localhost:9292/ping`


## Run tests

- `cd mini-rails; ruby mini-rails.rb`
