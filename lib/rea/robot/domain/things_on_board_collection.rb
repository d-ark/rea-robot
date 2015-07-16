module Rea
  module Robot
    class ThingsOnBoardCollection
      def initialize
        @collection = []
      end

      def push thing_on_board
        collection.push thing_on_board
      end

      def take_from_cell cell, requester
        things_on_cell(cell).each do |thing|
          collection.delete(thing).give(requester)
        end
      end

      private
        attr_reader :collection

        def things_on_cell cell
          collection.select { |thing| thing.on_cell? cell }
        end
    end
  end
end
