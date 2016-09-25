require 'rasem'
require 'logger'
require './bsp'

logger = Logger.new(STDOUT)
logger.level = Logger::DEBUG

node_tree = Node.new().split
logger.debug("Original node children: #{node_tree.children}")

node_tree.children[0].split
logger.debug("children[0] children: #{node_tree.children[0].children}")

node_tree.children[1].split
logger.debug("children[1] children: #{node_tree.children[1].children}")

File.open("test.svg", "w") do |f|
  Rasem::SVGImage.new({:width => node_tree.width, :height => node_tree.height}, f) do
    node_tree.children.each do |outer|
      outer.children.each do |n|
        p "rectangle(#{n.origin.x}, #{n.origin.y}, #{n.width}, #{n.height}, stroke: 'black', stroke_width: '2', fill: 'white')"
        rectangle(n.origin.x, n.origin.y, n.width, n.height, stroke: 'black', stroke_width: '2', fill: 'white')
      end
    end
  end
end


