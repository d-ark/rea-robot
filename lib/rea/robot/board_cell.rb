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

      def on_board? board
        board.on_board? @coord_x, @coord_y
      end

      def neighbour direction
        self.class.new neighbour_x(direction), neighbour_y(direction)
      end

      def to_s
        "#{coord_x},#{coord_y}"
      end

      protected

        attr_reader :coord_x, :coord_y

      private

        DELTA_X = {
          'north' => 0,
          'east' => 1,
          'south' => 0,
          'west' => -1
        }
        DELTA_Y = {
          'north' => 1,
          'east' => 0,
          'south' => -1,
          'west' => 0
        }

        def neighbour_x direction
          @coord_x + DELTA_X[direction]
        end

        def neighbour_y direction
          @coord_y + DELTA_Y[direction]
        end

    end
  end
end
