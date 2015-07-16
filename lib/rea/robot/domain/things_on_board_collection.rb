module Rea
  module Robot
    # represents collection of things on the board
    class ThingsOnBoardCollection
      def initialize board
        @collection = []
        @board = board
      end

      def push thing, cell
        collection.push ThingOnCell.new(thing, cell) if cell.on_board?(board) && things_on_cell(cell).empty?
      end

      def pick_from_cell cell, requester
        things_on_cell(cell).each do |thing|
          collection.delete(thing).give(requester)
        end
      end

      private
        attr_reader :collection, :board

        def things_on_cell cell
          collection.select { |thing| thing.on_cell? cell }
        end
    end
  end
end
