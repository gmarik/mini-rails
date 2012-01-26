require 'bundler'
require 'bundler/setup'

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
