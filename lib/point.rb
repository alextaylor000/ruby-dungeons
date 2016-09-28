class Point
  attr_accessor :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end

  def to_s
    "#{x},#{y}"
  end

  def inspect
    to_s
  end
end
