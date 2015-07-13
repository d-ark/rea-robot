require "spec_helper"
require "rea/robot/null_rotation"

describe Rea::Robot::NullRotation do
  it 'does nothing with direction' do
    described_class.new.rotate(double)
  end
end
