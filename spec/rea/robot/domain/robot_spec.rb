require "spec_helper"

module Rea
  module Robot

    describe Robot do
      let(:north) { Direction.new 'north' }
      let(:west) { Direction.new 'west' }
      let(:south) { Direction.new 'south' }
      let(:east) { Direction.new 'east' }
      let(:invalid_direction) { Direction.new('ololo') }

      let(:board) { Board.new 5, 5 }
      let(:null_cell) { BoardCellFactory.build nil, nil }
      let(:null_direction) { DirectionFactory.build nil }
      let(:cell) { BoardCell.new 1, 1 }
      let(:robot) { described_class.new board, null_cell, null_direction }
      let(:placed_robot) do
        placed_robot = described_class.new(board,null_cell,null_direction)
        placed_robot.place cell, north
        placed_robot
      end

      def position robot
        robot.build_view(Views::RobotView).to_s
      end

      it 'creates robot with empty position (not placed)' do
        expect(position(robot)).to eq ''
      end

      describe '#place' do
        let(:antother_cell) { BoardCell.new 2, 3 }
        let(:bad_cell) { BoardCell.new -1, 78 }

        it 'places directed robot to the cell' do
          robot.place cell, west
          expect(position(robot)).to eq '1,1,WEST'
        end

        it 'changes robots position' do
          placed_robot.place cell, west
          expect { placed_robot.place antother_cell, north }.to change { position(placed_robot) }
            .from('1,1,WEST').to('2,3,NORTH')
        end

        it 'cannot place robot outside the board' do
          robot.place bad_cell, west
          expect(position(robot)).to eq ''
        end

        it 'does not change robots position to outside the board' do
          placed_robot.place cell, west
          expect { placed_robot.place bad_cell, north }.not_to change { position(placed_robot) }
        end

        it 'cannot place robot with bad direction' do
          robot.place cell, invalid_direction
          expect(position(robot)).to eq ''
        end
      end

      describe '#rotate' do

        it 'turns robot right' do
          expect {placed_robot.rotate 'right'}.to change {position(placed_robot)}.from('1,1,NORTH').to('1,1,EAST')
          expect {placed_robot.rotate 'right'}.to change {position(placed_robot)}.from('1,1,EAST').to('1,1,SOUTH')
          expect {placed_robot.rotate 'right'}.to change {position(placed_robot)}.from('1,1,SOUTH').to('1,1,WEST')
          expect {placed_robot.rotate 'right'}.to change {position(placed_robot)}.from('1,1,WEST').to('1,1,NORTH')
        end

        it 'turns robot left' do
          expect {placed_robot.rotate 'left'}.to change {position(placed_robot)}.from('1,1,NORTH').to('1,1,WEST')
          expect {placed_robot.rotate 'left'}.to change {position(placed_robot)}.from('1,1,WEST').to('1,1,SOUTH')
          expect {placed_robot.rotate 'left'}.to change {position(placed_robot)}.from('1,1,SOUTH').to('1,1,EAST')
          expect {placed_robot.rotate 'left'}.to change {position(placed_robot)}.from('1,1,EAST').to('1,1,NORTH')
        end

        it 'does not turns not placed robot' do
          expect {robot.rotate 'left'}.not_to change {position(robot)}
          expect {robot.rotate 'right'}.not_to change {position(robot)}
        end
      end

      describe '#build_view' do
        it 'creates view with cell data' do
          view_class = double
          view = double
          expect(view_class).to receive(:new).with(cell: cell, direction: north) { view }
          expect(placed_robot.build_view view_class).to be view
        end
      end

      describe '#move' do
        let(:corner_cell) { BoardCell.new 0, 0 }

        it 'moves robot' do
          expect {placed_robot.move}.to change {position(placed_robot)}.from('1,1,NORTH').to('1,2,NORTH')
        end

        it 'moves robot' do
          expect {placed_robot.move}.to change {position(placed_robot)}.from('1,1,NORTH').to('1,2,NORTH')
        end

        it 'doesnt move robot outside the board' do
          robot.place corner_cell, south
          expect { robot.move }.not_to change { position(robot) }
        end
      end

    end
  end
end
