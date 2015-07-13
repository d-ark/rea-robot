require "spec_helper"
require "rea/robot/direction_factory"

describe Rea::Robot::DirectionFactory do

  it 'builds direction' do
    expect(described_class.build('north')).to eq Rea::Robot::Direction.new('north')
  end

  it 'builds null direction if provided data is not correct' do
    expect(described_class.build('ololo').class).to eq Rea::Robot::NullDirection
    expect(described_class.build(nil).class).to eq Rea::Robot::NullDirection
  end

end
