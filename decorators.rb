module Decorators
  def self.included(base)
    base.extend DecoratorExt
  end

  module DecoratorExt
    def method_added(name)
      super
      return unless @added_method
      @added_method = false
      original_method = instance_method(name)
      prefix = @prefix
      define_method(name) do |*args, &block|
        prefix + original_method.bind(self).call(*args, &block)
      end
    end

    def add_prefix(prefix)
      @prefix = prefix
      @added_method = true
    end
  end
end
