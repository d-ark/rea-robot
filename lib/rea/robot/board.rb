module Rea
  module Robot
    class Board
      def initialize width, height
        @width = width
        @height = height
      end

      def on_board? coord_x, coord_y
        (0..@width-1).include?(coord_x) && (0..@height-1).include?(coord_y)
      end
    end
  end
end
