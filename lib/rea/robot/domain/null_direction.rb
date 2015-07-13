module Rea
  module Robot
    class NullDirection
      def == _
        false
      end

      def valid?
        false
      end

      def rotate_left
        self.class.new
      end

      def rotate_right
        self.class.new
      end

      def to_s
        ''
      end

      def move _
        BoardCellFactory.build nil, nil
      end

    end
  end
end
