require "spec_helper"

describe Rea::Robot::NullRotation do
  it 'does nothing with direction' do
    direction = double
    expect(described_class.new.rotate(direction)).to eq direction
  end
end
