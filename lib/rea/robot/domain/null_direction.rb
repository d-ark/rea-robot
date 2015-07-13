module Rea
  module Robot
    # Represents invalid robot direction
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

      def move _
        BoardCellFactory.build nil, nil
      end

      def build_view view_class
        view_class.new nil
      end
    end
  end
end
