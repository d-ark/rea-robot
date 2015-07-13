require "spec_helper"

module Rea
  module Robot
    describe DirectionFactory do

      it 'builds direction' do
        expect(described_class.build('north')).to eq Direction.new('north')
      end

      it 'builds null direction if provided data is not correct' do
        expect(described_class.build('ololo').class).to eq NullDirection
        expect(described_class.build(nil).class).to eq NullDirection
      end
    end
  end
end
