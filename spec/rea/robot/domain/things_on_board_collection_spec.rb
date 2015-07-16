require 'spec_helper'

module Rea
  module Robot
    describe ThingsOnBoardCollection do
      let(:board) { Board.new 5, 5 }

      let(:thing) { Thing.new 'object' }
      let(:cell) { BoardCellFactory.build 1, 2 }
      let(:thing_on_board) { ThingOnBoard.new thing, cell }
      let(:collection) { described_class.new board }

      let(:bad_cell) { BoardCellFactory.build 7, 2 }
      let(:bad_thing_on_board) { ThingOnBoard.new thing, bad_cell }

      it 'pushes new thing_on_board to collection and allowes requester to take it' do
        collection.push thing_on_board
        requester = double
        expect(requester).to receive(:push).with thing
        collection.pick_from_cell cell, requester
      end

      it 'does not give anything to requester if collection is empty' do
        requester = double
        expect(requester).not_to receive(:push)
        collection.pick_from_cell cell, requester
      end

      it 'removes thing from collection when requester takes it' do
        collection.push thing_on_board
        requester = double
        expect(requester).to receive(:push).with(thing).once
        collection.pick_from_cell cell, requester
        collection.pick_from_cell cell, requester
      end

      it 'does not allow to push thing outside of board' do
        collection.push bad_thing_on_board

        requester = double
        expect(requester).not_to receive(:push)
        collection.pick_from_cell cell, requester
      end
    end
  end
end
