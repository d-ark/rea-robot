require "spec_helper"
require "rea/robot/null_rotation"

describe Rea::Robot::NullRotation do
  it 'does nothing with direction' do
    direction = double
    expect(described_class.new.rotate(direction)).to eq direction
  end
end
