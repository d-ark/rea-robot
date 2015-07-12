require "spec_helper"
require "rea/robot/robot"
require "rea/robot/board_cell"

describe Rea::Robot::Robot do
  let(:robot) { described_class.new }

  it 'creates robot with empty position (not placed)' do
    expect(robot.position).to eq ''
  end

  describe '#place' do
    let(:cell) { Rea::Robot::BoardCell.new 1, 1 }

    it 'places directed robot to the cell' do
      robot.place cell, 'west'
      expect(robot.position).to eq '1,1,WEST'
    end

  end

end
