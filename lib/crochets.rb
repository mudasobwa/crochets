require_relative 'crochets/version'
require 'aquarium'

module Crochets
  class Crocheter
    include Aquarium::DSL

    @@hooks = {}    
    private_class_method :new
    
    class << self
      def hook obj, meth, before: false, after: false, blocking: true, &cb
        this = Class === obj || object == obj
        around \
              :calls_to => meth, \
              :on_types => (Class === obj ? obj : obj.class), \
              :method_options => [:public, :protected, :private] \
          do |join_point, object, *args|
              blocking ? cb.call(object, *args) : Thread.new { cb.call(object, *args) }\
                if before && this
              result = join_point.proceed
              blocking ? cb.call(object, *args) : Thread.new { cb.call(object, *args) } \
                if after && this
              result
          end if before || after
      end
      # Helper method for calling convention consistency
      def unhook aspect
        aspect.unadvise unless aspect.nil?
      end
    end
  end
  
  class Tester
    def some_method
      p "Some method"
    end
  end
end
