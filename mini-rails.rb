require 'bundler'
Bundler.require(:default)
require 'action_controller/railtie'
# require 'action_mailer/railtie'
# require 'active_resource/railtie'
# require 'rails/test_unit/railtie'

module Apple
  extend self
  def call(env)
    [200,{'content-type' => 'text/html'},["Hello, World!"]]
  end
end


module Haxor
  def match(path,options=nil,&blk)
    puts "somethihng"
    if blk
      options ||= {}
      options[:to] ||= proc { [200,{'content-type' => 'text/html'},[blk.call]] }
    end
    super(path,options)
  end
end

ActionDispatch::Routing::Mapper.send(:include, Haxor)

module MiniRails
  class App < Rails::Application; end
    App.config.secret_token = '!*#&$' * 31

    App.routes.draw do
      get '/ping',   :to  => 'ping#ping'
      match '/pang', :to => Apple
      match '/pzng', :to => ->(hash) { [200,{'content-type' => 'text/html'},["Hello, World!"]] }
      match '/pung' do
        "Hello, World!"
      end

      get '/pxng' do
        "Hello, World!"
      end
    end
  end

  class PingController < ActionController::Base
    def ping
      render :text => 'pong'
    end
    def pang
      render :text => 'Hello, World!'
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

    def test_pang
      get '/pang'
      assert last_response.ok?, "response ok"
      assert_equal 'Hello, World!', last_response.body, "body contains hello, world!"
    end

    def test_pzng
      get '/pzng'
      assert last_response.ok?, "response ok"
      assert_equal 'Hello, World!', last_response.body, "body contains hello, world!"
    end
    def test_pung
      get '/pung'
      assert last_response.ok?, "response ok"
      assert_equal 'Hello, World!', last_response.body, "body contains hello, world!"
    end

    def test_pxng
      get '/pxng'
      assert last_response.ok?, "response ok"
      assert_equal 'Hello, World!', last_response.body, "body contains hello, world!"
    end
  end
end
