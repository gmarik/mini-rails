module Rails
  module Mini
    module Ext
      module RouterMappings
        def match(path,options=nil,&blk)
          if blk
            options ||= {}
            options[:to] ||= proc { [200,{'content-type' => 'text/html'},[blk.call]] }
          end
          super(path,options)
        end
      end
    end
  end
end

ActionDispatch::Routing::Mapper.send(:include, Rails::Mini::Ext::RouterMappings)
