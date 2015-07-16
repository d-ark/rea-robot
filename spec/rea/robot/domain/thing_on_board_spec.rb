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
    end
  end
end
