require 'bundler'
require 'bundler/setup'

require 'action_controller/railtie'
# require 'action_mailer/railtie'
# require 'active_resource/railtie'
# require 'rails/test_unit/railtie'

module MiniRails
  class App < Rails::Application; end
  App.config.secret_token = '!*#&$' * 31

  App.routes.draw do
    get '/ping', :to => 'ping#ping'
  end
end

class PingController < ActionController::Base
  def ping
    render :text => 'pong'
  end
end

if $0 == __FILE__

Bundler.require(:test)

require 'minitest/autorun'
require 'minitest/spec'
require 'rack/test'


describe MiniRails do
  include Rack::Test::Methods

  def app
    MiniRails::App
  end

  it 'responds' do
    get '/ping'
    assert               last_response.ok?
    assert_equal 'pong', last_response.body
  end
end

end
