## About
Simple Web DSL built with rails

Sometimes rails feels over powering, luckily rails is quite modular. This gem provides sane defaults, with a simple, familiar and handy DSL

[rails_mini](http://github.com/gmarik/mini-rails) is a single-file-rails-app project

## Getting Started


## Example
```ruby
App = Rails.app do
  class PingController < ActionController::Base
    def ping
      render text: 'pong'
    end
  end

  config.secret_token = '!*#&$' * 31

  get '/ping',   :to  => 'ping#ping'
  match '/pang', :to => Apple
  match '/pzng', :to => ->(hash) { [200,{'content-type' => 'text/html'},["Hello, World!"]] }
  match '/pung' do
    render text: "Hello, World!"
  end

  get '/pxng' do
    render text: "Hello, World!"
  end

  get '/ptng' do
    render text: "Hello, World!"
  end

  post '/ptng' do
    render text: "POST Hello, World!"
  end
end
```

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

## Inspiration

- sinatra
- astaire
