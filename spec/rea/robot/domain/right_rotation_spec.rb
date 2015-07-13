require "spec_helper"

module Rea
  module Robot
    describe RightRotation do
      it 'calls #rotate_right on direction' do
        direction = double

        expect(direction).to receive(:rotate_right).once

        described_class.new.rotate(direction)
      end
    end
  end
end
