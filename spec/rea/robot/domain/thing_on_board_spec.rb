require 'spec_helper'

module Rea
  module Robot
    describe ThingOnBoard do
      let(:thing) { Thing.new 'object' }
      let(:cell) { BoardCellFactory.build 1, 2 }
      let(:thing_on_board) { described_class.new thing, cell }

      it 'creates thing_on_board' do
        expect(thing_on_board).to be
      end

      describe '#on_cell?' do
        it 'knows if he is on certan cell' do
          expect(thing_on_board.on_cell? cell).to be
          expect(thing_on_board.on_cell? BoardCellFactory.build(1, 1)).not_to be
        end
      end

      describe '#give' do
        it 'gives a thing to requester' do
          robot = double
          expect(robot).to receive(:push).with(thing)
          thing_on_board.give robot
        end
      end
    end
  end
end
