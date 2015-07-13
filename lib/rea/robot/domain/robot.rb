module Rea
  module Robot
    # Represents robot placed on the board
    class Robot

      def initialize board, cell, direction
        @board = board
        @direction = direction
        @cell = cell
      end

      def position
        placed? ? "#{cell.to_s},#{direction.to_s}" : ""
      end

      def build_view view_class
        view_class.new cell: cell, direction: direction
      end

      def place new_cell, new_direction
        return unless new_direction.valid? && new_cell.on_board?(board)
        @cell = new_cell
        @direction = new_direction
      end

      def rotate side
        @direction = Rotation.build(side).rotate direction
      end

      def move
        place next_cell, direction
      end

      private

        attr_reader :cell, :direction, :board

        def placed?
          direction.valid?
        end

        def next_cell
          direction.move cell
        end

    end
  end
end
