module Rea
  module Robot
    class Robot

      def initialize board
        @board = board
      end

      def position
        placed? ? "#{cell.to_s},#{direction.upcase}" : ""
      end

      def place cell, direction
        return if invalid_cell? cell
        @cell = cell
        @direction = direction
      end

      def rotate side
        @direction = next_direction side if placed?
      end

      def move
        @cell = next_cell if should_move?
      end

      private

        attr_reader :cell, :direction, :board

        def invalid_cell? new_cell
          !new_cell.on_board? board
        end

        DIRECTIONS = ['north', 'east', 'south', 'west']

        def next_direction side
          DIRECTIONS[ ( DIRECTIONS.find_index(direction) + step(side) ) % DIRECTIONS.size]
        end

        def step side
          side == 'right' ? 1 : -1
        end

        def placed?
          !!(cell && direction)
        end

        def should_move?
          placed? && !invalid_cell?(next_cell)
        end

        def next_cell
          cell.neighbour direction
        end

    end
  end
end
