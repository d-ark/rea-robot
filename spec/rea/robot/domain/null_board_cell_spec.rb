require "spec_helper"

module Rea
  module Robot
    describe NullBoardCell do
      let(:board_cell) { described_class.new }

      it 'null cell is not equal to any other' do
        cell = described_class.new
        same_cell = described_class.new
        real_cell = BoardCell.new(2,2)

        expect(cell).not_to eq same_cell
        expect(cell).not_to eq real_cell
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

      it 'represents with view' do
        view_class = double
        view = double
        expect(view_class).to receive(:new).with(nil) { view }
        expect(board_cell.build_view view_class).to be view
      end

    end
  end
end
