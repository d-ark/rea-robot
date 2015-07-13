require "spec_helper"

module Rea
  module Robot
    describe BoardCellFactory do

      it 'builds cell' do
        expect(described_class.build(1, 1)).to eq BoardCell.new(1, 1)
      end

      it 'builds cell if numbers are provided as strings' do
        expect(described_class.build('1','1')).to eq BoardCell.new(1, 1)
      end

      it 'builds null cell if provided data is not correct' do
        expect(described_class.build('a', 1).class).to eq NullBoardCell
        expect(described_class.build(1, nil).class).to eq NullBoardCell
      end

    end
  end
end
