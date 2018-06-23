require 'spec_helper'
require 'pry'
describe Output do
  it 'displays a table based on the input array' do
    expected_output = "     1     2     3     \n     ------------------\n1  | 1     2     3     \n2  | 2     4     6     \n3  | 3     6     9     \n"
    expect do
      Output.new.table([1, 2, 3])
    end.to output(expected_output).to_stdout
  end
end
