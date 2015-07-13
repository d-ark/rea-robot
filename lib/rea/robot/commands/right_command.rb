module Rea
  module Robot
    # Represents command object for handling RIGHT command sent to robot
    class RightCommand
      def initialize robot, _
        @robot = robot
      end

      def call
        robot.rotate 'right'
        ''
      end

      private
        attr_reader :robot
    end
  end
end
