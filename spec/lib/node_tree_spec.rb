require './spec/support/helper_methods'
require './lib/node_tree'

describe NodeTree do
  include HelperMethods

  context 'with an initial seed' do
    it 'behaves deterministically' do
      results = 10.times.map { NodeTree.new(seed: 123).inspect(true) }
      expect(all_identical?(results)).to be true
    end
  end

  context 'without an initial seed' do
    it 'behaves randomly' do
      results = 10.times.map { NodeTree.new().inspect(true) }
      expect(all_identical?(results)).to be false
    end
  end

  context 'with a custom depth' do
    it 'generates nodes to the desired depth'
  end
end
