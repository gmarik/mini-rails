require 'spec_helper'
require 'rails_mini'

module Apple
  extend self
  def call(env)
    [200,{'content-type' => 'text/html'},["Hello, World!"]]
  end
end

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

describe App do
   include Rack::Test::Methods
   def app
     @app ||= App
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

    it 'renders' do
      get '/ptng'
      last_response.should be_ok
      last_response.body.should == 'Hello, World!'
    end
    it 'renders' do
      post '/ptng'
      last_response.should be_ok
      last_response.body.should == 'POST Hello, World!'
    end
  end
end
