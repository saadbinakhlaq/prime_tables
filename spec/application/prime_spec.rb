require 'spec_helper'

describe Prime do
  describe '#take' do
    context 'when number is less than 2' do
      it 'raises InvalidArgumentError' do
        expect { described_class.new.take(1) }.to raise_error(Errors::InvalidArgument)
      end
    end

    context 'when number is greater than 2' do
      it 'returns first n prime numbers' do
        expect(described_class.new.take(10)).to eq([2, 3, 5, 7])
      end
    end
  end
end
