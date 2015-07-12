require 'rea/robot/board_cell_factory'

module Rea
  module Robot
    class BoardCell
      def initialize left, top
        @left = left
        @top = top
      end

      def == other
        @left == other.left && @top == other.top
      end

      def on_board? board
        board.on_board? @left, @top
      end

      def neighbour direction
        BoardCellFactory.build neighbour_x(direction), neighbour_y(direction)
      end

      def to_s
        "#{left},#{top}"
      end

      protected

        attr_reader :left, :top

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
          @left + DELTA_X[direction]
        end

        def neighbour_y direction
          @top + DELTA_Y[direction]
        end

    end
  end
end
