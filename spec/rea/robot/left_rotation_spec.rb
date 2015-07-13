require "spec_helper"
require "rea/robot/left_rotation"

describe Rea::Robot::LeftRotation do
  it 'calls #rotate_left on direction' do
    direction = double

    expect(direction).to receive(:rotate_left).once

    described_class.new.rotate(direction)
  end
end
