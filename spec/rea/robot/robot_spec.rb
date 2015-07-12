require "spec_helper"
require "rea/robot/robot"
require "rea/robot/board_cell"
require "rea/robot/board"

describe Rea::Robot::Robot do
  let(:board) { Rea::Robot::Board.new 5, 5 }
  let(:cell) { Rea::Robot::BoardCell.new 1, 1 }
  let(:robot) { described_class.new board }
  let(:placed_robot) do
    placed_robot = described_class.new(board)
    placed_robot.place cell, 'north'
    placed_robot
  end


  it 'creates robot with empty position (not placed)' do
    expect(robot.position).to eq ''
  end

  describe '#place' do
    let(:antother_cell) { Rea::Robot::BoardCell.new 2, 3 }
    let(:bad_cell) { Rea::Robot::BoardCell.new -1, 78 }

    it 'places directed robot to the cell' do
      robot.place cell, 'west'
      expect(robot.position).to eq '1,1,WEST'
    end

    it 'changes robots position' do
      placed_robot.place cell, 'west'
      expect { placed_robot.place antother_cell, 'north' }.to change { placed_robot.position }
        .from('1,1,WEST').to('2,3,NORTH')
    end

    it 'cannot place robot outside the board' do
      robot.place bad_cell, 'west'
      expect(robot.position).to eq ''
    end

    it 'does not change robots position to outside the board' do
      placed_robot.place cell, 'west'
      expect { placed_robot.place bad_cell, 'north' }.not_to change { placed_robot.position }
    end

    it 'cannot place robot with bad direction' do
      robot.place cell, 'ololo'
      expect(robot.position).to eq ''
    end
  end

  describe '#rotate' do

    it 'turns robot right' do
      expect {placed_robot.rotate 'right'}.to change {placed_robot.position}.from('1,1,NORTH').to('1,1,EAST')
      expect {placed_robot.rotate 'right'}.to change {placed_robot.position}.from('1,1,EAST').to('1,1,SOUTH')
      expect {placed_robot.rotate 'right'}.to change {placed_robot.position}.from('1,1,SOUTH').to('1,1,WEST')
      expect {placed_robot.rotate 'right'}.to change {placed_robot.position}.from('1,1,WEST').to('1,1,NORTH')
    end

    it 'turns robot left' do
      expect {placed_robot.rotate 'left'}.to change {placed_robot.position}.from('1,1,NORTH').to('1,1,WEST')
      expect {placed_robot.rotate 'left'}.to change {placed_robot.position}.from('1,1,WEST').to('1,1,SOUTH')
      expect {placed_robot.rotate 'left'}.to change {placed_robot.position}.from('1,1,SOUTH').to('1,1,EAST')
      expect {placed_robot.rotate 'left'}.to change {placed_robot.position}.from('1,1,EAST').to('1,1,NORTH')
    end

    it 'does not turns not placed robot' do
      expect {robot.rotate 'left'}.not_to change {robot.position}
      expect {robot.rotate 'right'}.not_to change {robot.position}
    end
  end

  describe '#move' do
    let(:corner_cell) { Rea::Robot::BoardCell.new 0, 0 }

    it 'moves robot' do
      expect {placed_robot.move}.to change {placed_robot.position}.from('1,1,NORTH').to('1,2,NORTH')
    end

    it 'moves robot' do
      expect {placed_robot.move}.to change {placed_robot.position}.from('1,1,NORTH').to('1,2,NORTH')
    end

    it 'doesnt move robot outside the board' do
      robot.place corner_cell, 'south'
      expect { robot.move }.not_to change { robot.position }
    end
  end

end
