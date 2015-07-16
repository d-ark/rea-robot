require 'spec_helper'

module Rea
  module Robot
    describe ThingsOnBoardCollection do
      let(:thing) { Thing.new 'object' }
      let(:cell) { BoardCellFactory.build 1, 2 }
      let(:thing_on_board) { ThingOnBoard.new thing, cell }
      let(:collection) { described_class.new }

      it 'pushes new thing_on_board to collection and allowes requester to take it' do
        collection.push thing_on_board
        requester = double
        expect(requester).to receive(:push).with thing
        collection.take_from_cell cell, requester
      end

      it 'does not give anything to requester if collection is empty' do
        requester = double
        expect(requester).not_to receive(:push)
        collection.take_from_cell cell, requester
      end

      it 'removes thing from collection when requester takes it' do
        collection.push thing_on_board
        requester = double
        expect(requester).to receive(:push).with(thing).once
        collection.take_from_cell cell, requester
        collection.take_from_cell cell, requester
      end

    end
  end
end
