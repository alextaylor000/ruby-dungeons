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

  def inspect
    "<Node origin=(#{origin.x}, #{origin.y}), width=#{width}, height=#{height}>"
  end

  def split
    random_boolean ? split_horizontally : split_vertically
    self
  end

  private

  def random_boolean(max = 2)
    @gen ||= Random.new(seed)
    @gen.rand(max) == 1
  end

  def split_horizontally
    splitWidth = width
    splitHeight = height / 2

    self.children[0] = Node.new(origin: origin, width: splitWidth, height: splitHeight)
    self.children[1] = Node.new(origin: Point.new(origin.x, origin.y + splitHeight), width: width, height: height - splitHeight)
  end

  def split_vertically
    splitWidth = width / 2
    splitHeight = height

    self.children[0] = Node.new(origin: origin, width: splitWidth, height: splitHeight)
    self.children[1] =  Node.new(origin: Point.new(origin.x + splitWidth, origin.y), width: width - splitWidth, height: height)
  end

end
