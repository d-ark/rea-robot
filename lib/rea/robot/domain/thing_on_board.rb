module Rea
  module Robot
    class ThingOnBoard
      def initialize thing, cell
        @thing = thing
        @cell = cell
      end

      def on_cell? expected_cell
        cell == expected_cell
      end

      private

        attr_reader :thing, :cell
    end
  end
end
