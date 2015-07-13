module Rea
  module Robot
    class Board
      def initialize width, height
        @width = width
        @height = height
      end

      def include? left, top
        (0..@width-1).include?(left) && (0..@height-1).include?(top)
      end
    end
  end
end
