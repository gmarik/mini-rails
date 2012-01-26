## About

Gem Rails like Sinatra.

Mini Rails is a fun-hack that tweaks Rails routing allowing defining actions in simplest route definitions like match/get blocks.
So it's Rails but feels like Sinatra.

## Example `config.ru`

```ruby
require './lib/rails_mini'

app = Rails.mini do

  config.secret_token = '!*#&$' * 31

  get '/hello' do
    render text: "Hello #{params[:to]}!"
  end

  get '/ping' do
    render json: {'ping' => 'pong'}
  end
end

run app
```

## Installation

`gem install rails-mini`

## Example app

See [example](https://github.com/gmarik/mini-rails/tree/45dcc6da8eb07fa84d57aceb3d45c1aee01d72a0/example)

## Todo

    [x] Better defaults
    [/] Sinatra DSL
      [X] block dsl in router
      [X] block dsl behaviours like controller action
        [X] render
        [X] redirect
        [ ]
    [ ] real world usage
    [ ] example app

## Inspiration

- sinatra
- astaire

## Authors

- [gmarik](http://github.com/gmarik)
- [Stefan Penner](https://github.com/stefanpenner)
