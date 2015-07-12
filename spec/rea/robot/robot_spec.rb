require "spec_helper"
require "rea/robot/robot"

describe Rea::Robot::Robot do
  let(:robot) { described_class.new }

  it 'creates robot with empty position (not placed)' do
    expect(robot.position).to eq ''
  end

end
