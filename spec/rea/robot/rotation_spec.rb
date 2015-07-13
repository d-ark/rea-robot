require "spec_helper"
require "rea/robot/rotation"

describe Rea::Robot::Rotation do
  it 'builds LeftRotation if asked' do
    expect(described_class.build('left').class).to eq Rea::Robot::LeftRotation
  end

  it 'builds RightRotation if asked' do
    expect(described_class.build('right').class).to eq Rea::Robot::RightRotation
  end

  it 'builds NullRotation otherwise' do
    expect(described_class.build('ololo').class).to eq Rea::Robot::NullRotation
    expect(described_class.build(nil).class).to eq Rea::Robot::NullRotation
    expect(described_class.build('').class).to eq Rea::Robot::NullRotation
  end
end
