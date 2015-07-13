require "spec_helper"

module Rea
  module Robot
    describe RightCommand do
      let(:robot) do
        Robot.new(
          Board.new(5,5),
          BoardCellFactory.build(nil, nil),
          DirectionFactory.build(nil)
        )
      end

      let(:command) { described_class.new(robot, []) }

      def position robot
        robot.build_view(Views::RobotView).to_s
      end

      it 'rotates robot to right' do
        robot.place BoardCellFactory.build(0, 0), DirectionFactory.build('south')
        expect { command.call }.to change { position robot }.from('0,0,SOUTH').to('0,0,WEST')
      end

      it 'returns empty string after rotation' do
        robot.place BoardCellFactory.build(0, 0), DirectionFactory.build('south')
        expect(command.call).to eq ''
      end

      it 'ignores command when robot is not placed' do
        expect { command.call }.not_to change { position robot }
      end

      it 'returns empty string after ignoring' do
        expect(command.call).to eq ''
      end

    end
  end
end
