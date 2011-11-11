class Rails::Mini::Base
  class App < Rails::Application; end
  def initialize(&blk)
    App.config.secret_token = '!*#&$' * 31
    App.routes.draw &blk
    @app = App
  end
  def call(env)
    @app.call(env)
  end
end

def Rails.app(&blk)
  Rails::Mini::Base.new(&blk)
end
