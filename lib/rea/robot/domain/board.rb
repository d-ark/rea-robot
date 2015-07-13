module Rea
  module Robot
    # Represents board where robot can move
    class Board
      def initialize width, height
        @width = width
        @height = height
      end

      def include? left, top
        (0..width-1).include?(left) && (0..height-1).include?(top)
      end

      private
        attr_reader :width, :height
    end
  end
end
