require 'rails'
require 'action_controller/railtie'
require './lib/rails_mini/version'

class RailsMini
  class App < Rails::Application;end

  def initialize(&blk)
    App.routes.draw &blk
    @app = App
  end

  def call(env)
    @app.call(env)
  end
end

require 'rails_mini/ext'

def Rails.app(&blk)
  RailsMini.new(&blk)
end
