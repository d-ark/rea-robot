module Rea
  module Robot
    class MoveCommand
      def initialize robot, _
        @robot = robot
      end

      def call
        @robot.move
        ''
      end
    end
  end
end
