require 'rails'
module Rails::Mini
  autoload :Ext,  'rails/mini/ext'
  autoload :Base, 'rails/mini/base'
end

require 'action_controller/railtie'
