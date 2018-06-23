require 'spec_helper'

describe Input do
  context 'input is a numerical string' do
    it 'returns a number' do
      expect(described_class.new('10').sanitize).to eq(10)
    end
  end

  context 'input is not a number' do
    it 'raises an exception' do
      expect { described_class.new('a').sanitize }.to raise_error(ArgumentError)
    end
  end

  context 'input is nil' do
    it 'raises a exception' do
      expect { described_class.new(nil).sanitize }.to raise_error(TypeError)
    end
  end
end
