## About

[mini-rails](http://github.com/gmarik/mini-rails) is a single-file-rails-app project

## Todo

  [x] Better defaults
  [/] Sinatra DSL
    [X] block dsl in router
    [X] block dsl behaviours like controller action
      [X] render
      [X] redirect
      [ ] ....
    [ ] jsonp helpers?
    [ ] short helpers
      (jsonp,404,text,haml etc.)
      lets provide these as controller helpers, so they become backwards compatible
  [ ] Guides
  [ ] Example App, 1 branch per refactor
  [ ] Encourage fast tests
  [ ] Routing stuff
    [ ] Single Controller per routing context
    [ ] expose callbacks, helper methods...

## Future

  [ ] Async
    [ ] long connections
    [ ] large non-blocking fileuploads

## Example Ideas

...

## Run it

- `cd mini-rails; rackup`
- `curl http://localhost:9292/ping`

## Inspiration

- sinatra
- astaire

## Run tests

- `cd mini-rails; ruby mini-rails.rb`
