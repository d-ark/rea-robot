require "spec_helper"

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
      end
    end
  end
end
