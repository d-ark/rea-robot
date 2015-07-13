require "spec_helper"

module Rea
  module Robot
    describe LeftCommand do
      let(:robot) do
        Robot.new(
          Board.new(5,5),
          BoardCellFactory.build(nil, nil),
          DirectionFactory.build(nil)
        )
      end

      let(:command) { described_class.new(robot, []) }

      it 'rotates robot to left' do
        robot.place BoardCellFactory.build(0, 0), DirectionFactory.build('south')
        expect { command.call }.to change { robot.position }.from('0,0,SOUTH').to('0,0,EAST')
      end

      it 'returns empty string after rotation' do
        robot.place BoardCellFactory.build(0, 0), DirectionFactory.build('south')
        expect(command.call).to be ''
      end

      it 'ignores command when robot is not placed' do
        expect { command.call }.not_to change { robot.position }
      end

      it 'returns empty string after ignoring' do
        expect(command.call).to be ''
      end

    end
  end
end
