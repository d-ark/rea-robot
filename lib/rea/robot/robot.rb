module Rea
  module Robot
    class Robot

      def position
        cell && direction ? "1,1,#{direction.upcase}" : ""
      end

      def place cell, direction
        @cell = cell
        @direction = direction
      end

    private

      attr_reader :cell, :direction

    end
  end
end
