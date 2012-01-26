## About

Use Rails like Sinatra

## Example
```ruby
require './lib/rails_mini'

app = Rails.mini do

  config.secret_token = '!*#&$' * 31

  get '/hello' do
    render text: "Hello #{params[:who]}!"
  end

  get '/ping' do
    render json: {'ping' => 'pong'}
  end
end

run app
```

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
