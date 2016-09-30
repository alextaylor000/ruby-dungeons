require './spec/support/helper_methods'
require './lib/node'

describe Node do
  include HelperMethods

  context 'with a preset divisor' do
    it 'always generates the correct splits' do
      node = Node.new(width: 100, height: 100, divisor: 2).split
      expect(node.children.all?{ |c| c.width == 50 || c.width == 100 }).to be true
    end
  end
end
