module Rea
  module Robot
    class BoardCell
      def initialize coord_x, coord_y
        @coord_x = coord_x
        @coord_y = coord_y
      end

      def == other
        @coord_x == other.coord_x && @coord_y == other.coord_y
      end

      protected

        attr_reader :coord_x, :coord_y

    end
  end
end
