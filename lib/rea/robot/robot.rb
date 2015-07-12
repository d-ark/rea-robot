module Rea
  module Robot
    class Robot

      def initialize board
        @board = board
      end

      def position
        cell && direction ? "#{cell.to_s},#{direction.upcase}" : ""
      end

      def place cell, direction
        return if invalid_cell? cell
        @cell = cell
        @direction = direction
      end

    private

      attr_reader :cell, :direction, :board

      def invalid_cell? cell
        !cell.on_board? board
      end

    end
  end
end
