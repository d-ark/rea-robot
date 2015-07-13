module Rea
  module Robot
    # Represents cell where robot can be placed in
    class BoardCell
      def initialize left, top
        @left = left
        @top = top
      end

      def == other
        self.left == other.left && self.top == other.top
      end

      def on_board? board
        board.include? left, top
      end

      def neighbour horizontal, vetical
        BoardCellFactory.build left + horizontal, top + vetical
      end

      def to_s
        "#{left},#{top}"
      end

      protected

        attr_reader :left, :top
    end
  end
end
