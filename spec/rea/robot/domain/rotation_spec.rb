require "spec_helper"

module Rea
  module Robot
    describe Rotation do
      it 'builds LeftRotation if asked' do
        expect(described_class.build('left').class).to eq LeftRotation
      end

      it 'builds RightRotation if asked' do
        expect(described_class.build('right').class).to eq RightRotation
      end

      it 'builds NullRotation otherwise' do
        expect(described_class.build('ololo').class).to eq NullRotation
        expect(described_class.build(nil).class).to eq NullRotation
        expect(described_class.build('').class).to eq NullRotation
      end
    end
  end
end
