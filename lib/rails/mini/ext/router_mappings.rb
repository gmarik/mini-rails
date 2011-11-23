module Rails
  module Mini
    module Ext
      module RouterMappings
        def config
          Rails::Mini::Base::App.config
        end

        def match(path,options=nil,&blk)
          if blk
            options ||= {}

            controller = Class.new(ActionController::Base)

            controller.send(:define_method,path.to_sym,blk)

            options[:to] ||= controller.action(path.to_sym)
          end
          super(path,options)
        end
      end
    end
  end
end

ActionDispatch::Routing::Mapper.send(:include, Rails::Mini::Ext::RouterMappings)
