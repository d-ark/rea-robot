require "spec_helper"
require "rea/robot/views/board_cell_view"

module Rea
  module Robot
    module Views
      describe BoardCellView do
        let(:view) { described_class.new left: 1, top: 2 }
        let(:empty_view) { described_class.new nil }

        it 'renders empty_view to empty sting' do
          expect(empty_view.to_s).to eq ''
        end

        it 'renders view correctly' do
          expect(view.to_s).to eq '1,2'
        end

        it 'builds view with a cell' do
          cell = double
          view = double
          expect(cell).to receive(:build_view).with(described_class) { view }
          expect(described_class.build cell).to be view
        end

        it 'represents valid cell correctly' do
          cell = BoardCellFactory.build 1, 2
          expect(described_class.build(cell).to_s).to eq '1,2'
        end

        it 'represents null cell correctly' do
          cell = BoardCellFactory.build nil, nil
          expect(described_class.build(cell).to_s).to eq ''
        end

      end
    end
  end
end
