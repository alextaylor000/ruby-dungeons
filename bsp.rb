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


class Node
  attr_accessor :origin # top left
  attr_accessor :width, :height
  attr_accessor :children

  def initialize(origin = nil, width = 1000, height = 1000)
    @origin = origin || Point.new(0, 0)
    @width = width
    @height = height
    @children = []
  end

  def inspect
    "<Node #{origin.x}, #{origin.y}, #{width}, #{height}>"
  end

  def split
    self.children = []
    direction = rand(2)

    if direction == 0 # split horizontally
      splitWidth = width
      splitHeight = height / 2

      self.children << Node.new(origin, splitWidth, splitHeight)
      self.children << Node.new(Point.new(origin.x, origin.y + splitHeight), width, height - splitHeight)
    else # split vertically
      splitWidth = width / 2
      splitHeight = height

      self.children << Node.new(origin, splitWidth, splitHeight)
      self.children << Node.new(Point.new(origin.x + splitWidth, origin.y), width - splitWidth, height)
    end

    self
  end
end
