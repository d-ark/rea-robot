module Rea
  module Robot
    # Represents command object for handling REPORT command sent to robot
    class ReportCommand
      def initialize robot, _
        @robot = robot
      end

      def call
        robot.position
      end

      private
        attr_reader :robot
    end
  end
end
