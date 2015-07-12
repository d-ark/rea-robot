require 'rea/robot/direction'

module Rea
  module Robot
    class Robot

      def initialize board
        @board = board
      end

      def position
        placed? ? "#{cell.to_s},#{direction.to_s}" : ""
      end

      def place cell, direction
        return if invalid_cell?(cell) || !direction.valid?
        @cell = cell
        @direction = direction
      end

      def rotate side
        @direction = direction.rotate_right if placed? && side == 'right'
        @direction = direction.rotate_left if placed? && side == 'left'
      end

      def move
        @cell = next_cell if should_move?
      end

      private

        attr_reader :cell, :direction, :board

        def invalid_cell? new_cell
          !new_cell.on_board? board
        end

        def placed?
          !!(cell && direction.valid?)
        end

        def should_move?
          placed? && !invalid_cell?(next_cell)
        end

        def next_cell
          direction.move cell
        end

    end
  end
end
