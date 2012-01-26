require 'bundler'
require 'bundler/setup'
require 'rails_mini'

app = Rails.mini do

  config.secret_token = '!*#&$' * 31

  get '/' do
    render text: "Gem Rails like Sinatra. /rails-mini"
  end

  get '/hello' do
    render text: "Hello #{params[:to]}!"
  end

  get '/ping' do
    render json: {'ping' => 'pong'}
  end
end

run app
