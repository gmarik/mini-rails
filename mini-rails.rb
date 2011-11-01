require 'bundler'
Bundler.require(:default)

require 'action_controller/railtie'
# require 'action_mailer/railtie'
# require 'active_resource/railtie'
# require 'rails/test_unit/railtie'

module MiniRails
  class App < Rails::Application; end
  App.config.secret_token = '!*#&$' * 31
end


MiniRails::App.routes.draw do
  get '/ping', :to => 'ping#ping'
end

class PingController < ActionController::Base
  def ping
    render :text => 'pong'
  end
end


if $0 == __FILE__

# Bundler.require(:default, :test)

require 'test/unit'
require 'rack/test'

class HomepageTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    MiniRails::App
  end

  def test_ping_pong
    get '/ping'
    assert               last_response.ok?
    assert_equal 'pong', last_response.body
  end
end

end
