require "spec_helper"
require "rea/robot/views/board_cell_view"

module Rea
  module Robot
    module Views
      describe DirectionView do
        let(:view) { described_class.new 'west' }
        let(:empty_view) { described_class.new nil }

        it 'renders empty_view to empty sting' do
          expect(empty_view.to_s).to eq ''
        end

        it 'renders view correctly' do
          expect(view.to_s).to eq 'WEST'
        end

        it 'builds view with a direction' do
          direction = double
          view = double
          expect(direction).to receive(:build_view).with(described_class) { view }
          expect(described_class.build direction).to be view
        end

        it 'represents valid cell correctly' do
          cell = DirectionFactory.build 'west'
          expect(described_class.build(cell).to_s).to eq 'WEST'
        end

        it 'represents null cell correctly' do
          cell = DirectionFactory.build nil
          expect(described_class.build(cell).to_s).to eq ''
        end

      end
    end
  end
end
