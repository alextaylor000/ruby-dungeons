require 'rasem'
require './bsp'

node_tree = Node.new().split

File.open("test.svg", "w") do |f|
  Rasem::SVGImage.new({:width => node_tree.width, :height => node_tree.height}, f) do
    node_tree.children.each do |n|
      p "rectangle(#{n.origin.x}, #{n.origin.y}, #{n.width}, #{n.height}, stroke: 'black', stroke_width: '2', fill: 'white')"
      rectangle(n.origin.x, n.origin.y, n.width, n.height, stroke: 'black', stroke_width: '2', fill: 'white')
    end
  end
end

