require "spec_helper"

describe Rea::Robot::BoardCell do

  it 'creates cell' do
    described_class.new(1,2)
  end

  it 'compares cells' do
    cell1 = described_class.new(1,2)
    cell2 = described_class.new(1,2)
    cell3 = described_class.new(2,5)

    expect(cell1).to eq cell2
    expect(cell1).not_to eq cell3
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
