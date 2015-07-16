require 'spec_helper'

module Rea
  module Robot
    describe Thing do
      let(:thing) { described_class.new 'object' }

      it 'compares things' do
        expect(thing).to eq described_class.new('object')
        expect(thing).not_to eq described_class.new('not-object')
      end
    end
  end
end
