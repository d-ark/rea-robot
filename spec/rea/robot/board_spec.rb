require "spec_helper"
require "rea/robot/board"


describe Rea::Robot::Board do

  describe '#on_board?' do
    let(:board) { described_class.new(5, 5) }


    it 'returns true when gets coordinates inside board' do
      inside_samples = [0,0], [1,1], [0,4], [4,4], [2,3]

      inside_samples.each do |sample|
        expect(board.on_board *sample).to be
      end
    end

    it 'returns false when gets coordinates outside board' do
      outside_samples = [-1,0], [-1,-1], [5,-1], [5,1], [-78,3]

      outside_samples.each do |sample|
        expect(board.on_board *sample).not_to be
      end
    end

  end
end
