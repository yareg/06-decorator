require './decorators'

class C
  include Decorators

  add_prefix('hello ')
  def a
    'from a'
  end

  def b
    'from b'
  end
end

puts C.new.a # 'hello from a'
puts C.new.b # 'from b'
