require "spec_helper"
require "rea/robot/right_rotation"

describe Rea::Robot::RightRotation do
  it 'calls #rotate_right on direction' do
    direction = double

    expect(direction).to receive(:rotate_right).once

    described_class.new.rotate(direction)
  end
end
