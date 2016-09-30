require './lib/node'

class NodeTree
  attr_reader :width, :height, :seed, :divisor, :depth, :parent

  def initialize(width: 750,
                 height: 750,
                 seed: Random.new_seed,
                 divisor: nil,
                 depth: 3)
    @width = width
    @height = height
    @seed = seed
    @divisor = divisor
    @depth = depth
    set_prng
    build_parent
    build_tree
  end

  alias_method :default_inspect, :inspect
  def inspect(test_env = false)
    if test_env
      parent.inspect(true)
    else
      default_inspect
    end
  end

  private
  def set_prng
    srand(seed)
  end

  def prng
    @prng ||= Random.new(seed)
  end

  def build_parent
    @parent = Node.new(
      width: width,
      height: height,
      divisor: divisor
    )
  end

  def build_tree(parent = @parent, level = 1)
    return self if level == depth
    parent.split.children.each { |c| build_tree(c, level + 1) }
  end
end
