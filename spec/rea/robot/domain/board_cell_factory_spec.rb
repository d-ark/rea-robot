require "spec_helper"

describe Rea::Robot::BoardCellFactory do

  it 'builds cell' do
    expect(described_class.build(1, 1)).to eq Rea::Robot::BoardCell.new(1, 1)
  end

  it 'builds cell if numbers are provided as strings' do
    expect(described_class.build('1','1')).to eq Rea::Robot::BoardCell.new(1, 1)
  end

  it 'builds null cell if provided data is not correct' do
    expect(described_class.build('a', 1).class).to eq Rea::Robot::NullBoardCell
    expect(described_class.build(1, nil).class).to eq Rea::Robot::NullBoardCell
  end

end