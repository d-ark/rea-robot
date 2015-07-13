require "spec_helper"


module Rea
  module Robot
    describe NullRotation do
      it 'does nothing with direction' do
        direction = double
        expect(described_class.new.rotate(direction)).to eq direction
      end
    end
  end
end
