require "spec_helper"

module Rea
  module Robot
    describe BoardCell do

      it 'creates cell' do
        described_class.new(1,2)
      end

      it 'compares cells' do
        cell = described_class.new(1,2)
        same_cell = described_class.new(1,2)
        other_cell = described_class.new(2,5)

        expect(cell).to eq same_cell
        expect(cell).not_to eq other_cell
      end

      describe '#on_board?' do
        let(:board_cell) { described_class.new(1,2) }

        it 'calls valid on_board? method of a board' do
          board = double

          expect(board).to receive(:include?).with(1,2) { true }

          board_cell.on_board? board
        end

      end

      describe '#to_s' do
        let(:board_cell) { described_class.new(1,2) }

        it 'represents cell' do
          expect(board_cell.to_s).to eq('1,2')
        end
      end

      describe '#neighbour' do
        let(:cell) { described_class.new(2,2) }
        let(:neighbour_cell) { described_class.new(3,2) }

        it 'finds neighbour' do
          expect(cell.neighbour(1,0)).to eq neighbour_cell
        end
      end
    end
  end
end
