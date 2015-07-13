require "spec_helper"

module Rea
  module Robot
    describe ReportCommand do
      let(:robot) do
        Robot.new(
          Board.new(5,5),
          BoardCellFactory.build(nil, nil),
          DirectionFactory.build(nil)
        )
      end

      let(:command) { described_class.new(robot, []) }

      it 'returns robots position' do
        robot.place BoardCellFactory.build(0, 0), DirectionFactory.build('south')
        expect(command.call).to eq '0,0,SOUTH'
      end

      it 'returns empty string when robot is not placed on the Board' do
        expect(command.call).to eq ''
      end
    end
  end
end
