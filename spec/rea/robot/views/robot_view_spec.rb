require "spec_helper"
require "rea/robot/views/robot_view"

module Rea
  module Robot
    module Views
      describe RobotView do
        let(:cell) { BoardCellFactory.new 1, 2 }
        let(:direction) { DirectionFactory.new 'east' }
        let(:empty_cell) { BoardCellFactory.new nil, nil }
        let(:empty_direction) { DirectionFactory.new nil }
        let(:view) do
          described_class.new cell: cell, direction: direction
        end
        let(:empty_view) do
          described_class.new cell: empty_cell, direction: empty_direction
        end

        it 'represents empty_view as empty string' do
          expect(empty_view.to_s).to eq ''
        end

        it 'represents view correctly' do
          expect(view.to_s).to eq '1,2,EAST'
        end
      end
    end
  end
end
