require "spec_helper"
require "rea/robot/robot"
require "rea/robot/board_cell"
require "rea/robot/board"

describe Rea::Robot::Robot do
  let(:board) { Rea::Robot::Board.new 5, 5 }
  let(:robot) { described_class.new board }

  it 'creates robot with empty position (not placed)' do
    expect(robot.position).to eq ''
  end

  describe '#place' do
    let(:cell) { Rea::Robot::BoardCell.new 1, 1 }
    let(:antother_cell) { Rea::Robot::BoardCell.new 2, 3 }
    let(:bad_cell) { Rea::Robot::BoardCell.new -1, 78 }

    it 'places directed robot to the cell' do
      robot.place cell, 'west'
      expect(robot.position).to eq '1,1,WEST'
    end

    it 'changes robots position' do
      robot.place cell, 'west'
      expect { robot.place antother_cell, 'north' }.to change { robot.position }
        .from('1,1,WEST').to('2,3,NORTH')
    end

    it 'cannot place robot outside the board' do
      robot.place bad_cell, 'west'
      expect(robot.position).to eq ''
    end

    it 'does not change robots position to outside the board' do
      robot.place cell, 'west'
      expect { robot.place bad_cell, 'north' }.not_to change { robot.position }
    end
  end

end
