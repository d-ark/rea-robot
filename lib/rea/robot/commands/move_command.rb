module Rea
  module Robot
    # Represents command object for handling MOVE command sent to robot
    class MoveCommand
      def initialize robot, _
        @robot = robot
      end

      def call
        robot.move
        ''
      end

      private
        attr_reader :robot
    end
  end
end
