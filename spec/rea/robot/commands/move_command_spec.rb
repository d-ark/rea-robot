require "spec_helper"

module Rea
  module Robot
    describe MoveCommand do
      let(:robot) do
        Robot.new(
          Board.new(5,5),
          BoardCellFactory.build(2, 2),
          DirectionFactory.build('north')
        )
      end

      let(:command) { MoveCommand.new(robot, []) }

      it 'moves robot' do
        expect { command.call }.to change { robot.position }.from('2,2,NORTH').to('2,3,NORTH')
      end

      it 'does not move robot outside' do
        robot.place BoardCellFactory.build(0, 0), DirectionFactory.build('south')

        expect { command.call }.not_to change { robot.position }
      end

      it 'returns empty string' do
        expect(command.call).to eq ''
      end

      it 'returns empty string when command is ignored too' do
        robot.place BoardCellFactory.build(0, 0), DirectionFactory.build('south')
        expect(command.call).to eq ''
      end

    end
  end
end
