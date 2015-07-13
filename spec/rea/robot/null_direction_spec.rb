require "spec_helper"
require "rea/robot/null_direction"
require 'rea/robot/board_cell_factory'
require 'rea/robot/direction'


describe Rea::Robot::NullDirection do
  let(:direction) { described_class.new }

  it 'is not equal to other directions' do
    expect(direction).not_to eq direction
    expect(direction).not_to eq Rea::Robot::Direction.new('east')
  end

  describe '#rotate_left' do
    it 'returns null_direction' do
      expect(direction.rotate_left.class).to eq described_class
    end
  end

  describe '#rotate_right' do
    it 'returns null_direction' do
      expect(direction.rotate_right.class).to eq described_class
    end
  end

  describe '#to_s' do
    it 'returns empty string' do
      expect(direction.to_s).to eq ""
    end
  end

  describe '#valid?' do
    it 'returns false' do
      expect(direction).not_to be_valid
    end
  end

  describe '#move' do
    let(:cell) { Rea::Robot::BoardCell.new(2,2) }

    it 'returns null cell' do
      expect(direction.move(cell).class).to eq Rea::Robot::NullBoardCell
    end

  end

end
