require 'spec_helper'
require 'rails/mini/all'

module Apple
  extend self
  def call(env)
    [200,{'content-type' => 'text/html'},["Hello, World!"]]
  end
end

module Rails::Mini
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
    get '/ptng' do
      render text: "Hello, World!"
    end
  end

  class PingController < ActionController::Base
    def ping
      render text: 'pong'
    end
    def pang
      render text: 'Hello, World!'
    end
  end
end


describe Rails::Mini::App do
   include Rack::Test::Methods
   def app
     @app ||= Rails::Mini::App
   end

  describe 'get' do
    it "test_ping_pong" do
      get '/ping'
      last_response.should be_ok
      last_response.body.should == 'pong'
    end

    it 'test_pang' do
      get '/pang'
      last_response.should be_ok
      last_response.body.should == 'Hello, World!'
    end

    it 'test_pzng' do
      get '/pzng'
      last_response.should be_ok
      last_response.body.should == 'Hello, World!'
    end

    it 'test_pung' do
      get '/pung'
      last_response.should be_ok
      last_response.body.should == 'Hello, World!'
    end

    it 'test_pxng' do
      get '/pxng'
      last_response.should be_ok
      last_response.body.should == 'Hello, World!'
    end

    it 'test_ptng' do
      get '/ptng'
      last_response.should be_ok
      last_response.body.should == 'Hello, World!'
    end
  end
end
