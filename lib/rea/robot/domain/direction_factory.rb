require "rea/robot/domain/direction"
require "rea/robot/domain/null_direction"

module Rea
  module Robot
    # Factory for getting robot directions
    class DirectionFactory
      def self.build direction
        direction = Direction.new direction
        return direction if direction.valid?
        NullDirection.new
      end
    end
  end
end
