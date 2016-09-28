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

    set_prng_seed
  end

  def inspect(test_env = false)
    if test_env
      [
       origin.x, origin.y, width, height,
       children.map { |c| c.inspect(true) }
      ].flatten.join("-")
    else
      "<Node origin=(#{origin.x}, #{origin.y}), width=#{width}, height=#{height}>"
    end
  end

  def split
    random_boolean ? split_horizontally : split_vertically
    self
  end

  private

  # After setting the seed with `srand`, all subsequent calls to `rand`, `sample`, etc.
  # will behave deterministically.
  def set_prng_seed
    srand(seed)
  end

  def random_boolean(max = 2)
    rand(max) == 1
  end

  def random_divisor
    [2, 3, 4, 5].sample
  end

  def split_horizontally
    splitWidth = width
    splitHeight = height / random_divisor

    self.children[0] = Node.new(origin: origin, width: splitWidth, height: splitHeight)
    self.children[1] = Node.new(origin: Point.new(origin.x, origin.y + splitHeight), width: width, height: height - splitHeight)
  end

  def split_vertically
    splitWidth = width / random_divisor
    splitHeight = height

    self.children[0] = Node.new(origin: origin, width: splitWidth, height: splitHeight)
    self.children[1] =  Node.new(origin: Point.new(origin.x + splitWidth, origin.y), width: width - splitWidth, height: height)
  end

end
