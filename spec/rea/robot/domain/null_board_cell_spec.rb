require "spec_helper"

module Rea
  module Robot
    describe NullBoardCell do
      let(:board_cell) { described_class.new }

      it 'null cell is not equal to any other' do
        cell1 = described_class.new
        cell2 = described_class.new
        cell3 = BoardCell.new(2,2)

        expect(cell1).not_to eq cell2
        expect(cell1).not_to eq cell3
      end

      it 'is always outside board' do
        expect(board_cell.on_board? double).not_to be
      end


      it 'represents cell' do
        expect(board_cell.to_s).to eq ''
      end

      it 'finds neighbour' do
        expect(board_cell.neighbour('north').class).to eq described_class
      end

    end
  end
end
