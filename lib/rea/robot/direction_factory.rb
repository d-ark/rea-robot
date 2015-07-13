require "rea/robot/direction"
require "rea/robot/null_direction"

module Rea
  module Robot
    class DirectionFactory
      def self.build direction
        direction = Direction.new direction
        return direction if direction.valid?
        NullDirection.new
      end
    end
  end
end
