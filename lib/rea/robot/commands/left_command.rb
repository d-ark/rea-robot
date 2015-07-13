module Rea
  module Robot
    # Represents command object for handling LEFT command sent to robot
    class LeftCommand
      def initialize robot, _
        @robot = robot
      end

      def call
        robot.rotate 'left'
        ''
      end

      private
        attr_reader :robot
    end
  end
end
