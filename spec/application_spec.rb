require 'spec_helper'

describe Application do
  describe '#run' do
    context 'when argument is a number' do
      context 'when argument is greater than 1' do
        it 'prints a table to stdout' do
          expected_output = "     2     3     \n     ------------\n2  | 4     6     \n3  | 6     9     \n"
          expect do
            described_class.new('3').run
          end.to output(expected_output).to_stdout
        end
      end

      context 'when argument is less than 1' do
        it 'prints an error and exits' do
          expect do
            described_class.new('-1').run
          end.to output(I18n.t('errors.invalid_argument')).to_stdout.
            and raise_error(SystemExit)
        end
      end
    end

    context 'when argument is not a number' do
      it 'prints an error and exits' do
        expect do
          described_class.new('asd').run
        end.to output(I18n.t('errors.invalid_argument')).to_stdout.
          and raise_error(SystemExit)
      end
    end
  end
end
