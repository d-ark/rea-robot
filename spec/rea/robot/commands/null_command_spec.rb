require "spec_helper"

module Rea
  module Robot
    describe NullCommand do
      let(:robot) { double }

      let(:command) { described_class.new(robot, []) }

      it 'returns empty string' do
        expect(command.call).to eq ''
      end
    end
  end
end
