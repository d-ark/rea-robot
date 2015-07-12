require "spec_helper"
require "rea/robot/board_cell"

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

      expect(board).to receive(:on_board?).with(1,2) { true }

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
    # The origin (0,0) can be considered to be the SOUTH WEST most corner.
    #
    # -------  0 - (0,0)-point
    # |     |  * - center point
    # |  N  |  N - north point (1 step from center in north direction)
    # | W*E |  E - east point (1 step from center in east direction)
    # |  S  |  S - south point (1 step from center in south direction)
    # |0    |  W - west point (1 step from center in west direction)
    # -------

    let(:center_cell) { described_class.new(2,2) }
    let(:north_cell)  { described_class.new(2,3) }
    let(:east_cell)   { described_class.new(3,2) }
    let(:south_cell)  { described_class.new(2,1) }
    let(:west_cell)   { described_class.new(1,2) }

    it 'finds north neighbour' do
      expect(center_cell.neighbour('north')).to eq north_cell
    end

    it 'finds east neighbour' do
      expect(center_cell.neighbour('east')).to eq east_cell
    end

    it 'finds south neighbour' do
      expect(center_cell.neighbour('south')).to eq south_cell
    end

    it 'finds west neighbour' do
      expect(center_cell.neighbour('west')).to eq west_cell
    end

  end
end
