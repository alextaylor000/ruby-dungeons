require './lib/node'

describe Node do
  context 'with an initial seed' do
    it 'behaves deterministically' do
      results = 10.times.map { Node.new(seed: 123).split.inspect(true) }
      expect(
        results.all?{ |r| r == results.first }
      ).to be true
    end
  end

  context 'without an initial seed' do
    it 'behaves randomly' do
      results = 10.times.map { Node.new().split.inspect(true) }
      expect(
        results.all?{ |r| r == results.first }
      ).to be false
    end
  end

  context 'with a custom divisor' do
    it 'always generates the correct splits'
  end

end
