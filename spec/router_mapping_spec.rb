require 'spec_helper'
require 'rails_mini'

module Apple
  extend self
  def call(env)
    [200,{'content-type' => 'text/html'},["Hello, World!"]]
  end
end

App = Rails.mini do

  class PingController < ActionController::Base
    def ping
      render text: 'pong'
    end
  end

  config.secret_token = '!*#&$' * 31

  get '/ping',   :to  => 'ping#ping'
  match '/rack_apple', :to => Apple
  match '/lambda', :to => ->(hash) { [200,{'content-type' => 'text/html'},["Hello, World!"]] }

  match '/match_with_block' do
    render text: "match with block"
  end

  get '/get_with_block' do
    render text: "get with block"
  end

  put '/ping' do
    render text: "Put ping?"
  end

  post '/ping' do
    render json: {'ping' => 'pong'}
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

    it 'test rack app' do
      get '/rack_apple'
      last_response.should be_ok
      last_response.body.should == 'Hello, World!'
    end

    it 'test_lambda_rack_app' do
      get '/lambda'
      last_response.should be_ok
      last_response.body.should == 'Hello, World!'
    end

    it 'match_with_block' do
      get '/match_with_block'
      last_response.should be_ok
      last_response.body.should == 'match with block'
    end

    it 'test get with block' do
      get '/get_with_block'
      last_response.should be_ok
      last_response.body.should == 'get with block'
    end

    it 'accepts put and renders' do
      put '/ping'
      last_response.should be_ok
      last_response.body.should == 'Put ping?'
    end

    it 'accepts posts and renders json' do
      post '/ping'
      last_response.should be_ok
      last_response.body.should == %Q[{"ping":"pong"}]
    end
  end
end
