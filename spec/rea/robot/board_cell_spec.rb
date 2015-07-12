require "spec_helper"
require "rea/robot/board_cell"

describe Rea::Robot::BoardCell do

  it 'creates cell' do
    described_class.new(1,2)
  end

  it 'compares cells' do
    cell1 = described_class.new(1,2)
    cell2 = described_class.new(1,2)
    cell3 = described_class.new(2,5)

    expect(cell1).to eq cell2
    expect(cell1).not_to eq cell3
  end

end
