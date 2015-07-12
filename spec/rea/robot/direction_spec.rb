require "spec_helper"
require "rea/robot/direction"

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
end
