require './lib/point'

class Node
  attr_accessor :origin # top left
  attr_accessor :width, :height
  attr_reader   :seed
  attr_accessor :children

  def initialize(origin: nil, width: 750, height: 750, seed: Random.new_seed)
    @origin = origin || Point.new(0, 0)
    @width = width
    @height = height
    @seed = seed
    @children = []
  end

  def next_rand(max = 2)
    @gen ||= Random.new(seed)
    @gen.rand(max)
  end

  def split()
    direction = next_rand

    if direction == 0 # split horizontally
      splitWidth = width
      splitHeight = height / 2

      self.children[0] = Node.new(origin: origin, width: splitWidth, height: splitHeight)
      self.children[1] = Node.new(origin: Point.new(origin.x, origin.y + splitHeight), width: width, height: height - splitHeight)
    else # split vertically
      splitWidth = width / 2
      splitHeight = height

      self.children[0] = Node.new(origin: origin, width: splitWidth, height: splitHeight)
      self.children[1] =  Node.new(origin: Point.new(origin.x + splitWidth, origin.y), width: width - splitWidth, height: height)
    end

    self
  end

  def inspect
    "<Node origin=(#{origin.x}, #{origin.y}), width=#{width}, height=#{height}>"
  end
end
