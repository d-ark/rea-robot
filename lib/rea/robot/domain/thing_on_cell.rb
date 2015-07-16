module Rea
  module Robot
    # represents a thing placed on the board
    class ThingOnCell
      def initialize thing, cell
        @thing = thing
        @cell = cell
      end

      def on_cell? expected_cell
        cell == expected_cell
      end

      def on_board? board
        cell.on_board? board
      end

      def give requester
        requester.push thing
      end

      private

        attr_reader :thing, :cell
    end
  end
end
