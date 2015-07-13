require "spec_helper"

describe Rea::Robot::Direction do
  let(:direction) { described_class.new 'north' }

  it 'compares directions' do
    expect(direction).to eq described_class.new('north')
    expect(direction).not_to eq described_class.new('west')
  end

  describe '#rotate_left' do
    it 'compares directions' do
      expect(direction.rotate_left).to eq described_class.new('west')
    end
  end

  describe '#rotate_right' do
    it 'compares directions' do
      expect(direction.rotate_right).to eq described_class.new('east')
    end
  end

  describe '#to_s' do
    it 'returns upcased direction' do
      expect(direction.to_s).to eq "NORTH"
    end
  end

  describe '#valid?' do
    it 'returns true if valid' do
      expect(direction).to be_valid
    end

    it 'returns false if not valid' do
      expect(described_class.new 'ololo').not_to be_valid
    end
  end

  describe '#move' do
    # The origin (0,0) can be considered to be the SOUTH WEST most corner.
    #
    # -------  0 - (0,0)-point
    # |     |  * - center point
    # |  N  |  N - north point (1 step from center in north direction)
    # | W*E |  E - east point (1 step from center in east direction)
    # |  S  |  S - south point (1 step from center in south direction)
    # |0    |  W - west point (1 step from center in west direction)
    # -------

    let(:center_cell) { Rea::Robot::BoardCell.new(2,2) }
    let(:north_cell)  { Rea::Robot::BoardCell.new(2,3) }
    let(:east_cell)   { Rea::Robot::BoardCell.new(3,2) }
    let(:south_cell)  { Rea::Robot::BoardCell.new(2,1) }
    let(:west_cell)   { Rea::Robot::BoardCell.new(1,2) }

    let(:north)  { described_class.new 'north' }
    let(:east)   { described_class.new 'east' }
    let(:south)  { described_class.new 'south' }
    let(:west)   { described_class.new 'west' }

    it 'finds north neighbour' do
      expect(north.move center_cell).to eq north_cell
    end

    it 'finds east neighbour' do
      expect(east.move center_cell).to eq east_cell
    end

    it 'finds south neighbour' do
      expect(south.move center_cell).to eq south_cell
    end

    it 'finds west neighbour' do
      expect(west.move center_cell).to eq west_cell
    end

  end

end
