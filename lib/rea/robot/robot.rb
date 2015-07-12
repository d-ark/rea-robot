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

      def rotate side
        @direction = next_direction side
      end

    private

      attr_reader :cell, :direction, :board

      def invalid_cell? cell
        !cell.on_board? board
      end

      DIRECTIONS = ['north', 'east', 'south', 'west']

      def next_direction side
        DIRECTIONS[ ( DIRECTIONS.find_index(@direction) + step(side) ) % DIRECTIONS.size]
      end

      def step side
        side == 'right' ? 1 : -1
      end

    end
  end
end
