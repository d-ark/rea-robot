require 'rea/robot/direction'
require 'rea/robot/rotation'

module Rea
  module Robot
    class Robot

      def initialize board
        @board = board
      end

      def position
        placed? ? "#{cell.to_s},#{direction.to_s}" : ""
      end

      def place new_cell, new_direction
        return unless new_direction.valid? && valid_cell?(new_cell)
        @cell = new_cell
        @direction = new_direction
      end

      def rotate side
        return unless placed?
        @direction = Rotation.build(side).rotate direction
      end

      def move
        @cell = next_cell if should_move?
      end

      private

        attr_reader :cell, :direction, :board

        def valid_cell? new_cell
          new_cell.on_board? board
        end

        def placed?
          !!(cell && direction.valid?)
        end

        def should_move?
          placed? && valid_cell?(next_cell)
        end

        def next_cell
          direction.move cell
        end

    end
  end
end
