require 'spec_helper'

module Rea
  module Robot
    describe ThingsOnBoardCollection do
      let(:thing) { Thing.new 'object' }
      let(:cell) { BoardCellFactory.build 1, 2 }
      let(:thing_on_board) { ThingOnBoard.new thing, cell }
      let(:collection) { described_class.new }

      it 'pushes new thing_on_board to collection and allowes robot to take it' do
        collection.push thing_on_board
        robot = double
        expect(robot).to receive(:push).with thing
        collection.take_from_cell cell, robot
      end

    end
  end
end
