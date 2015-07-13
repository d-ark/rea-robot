module Rea
  module Robot
    # Represents invalid board cell
    class NullBoardCell
      def == _
        false
      end

      def on_board? _
        false
      end

      def to_s
        ''
      end

      def neighbour _
        self.class.new
      end

    end
  end
end
