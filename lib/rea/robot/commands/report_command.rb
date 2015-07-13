module Rea
  module Robot
    # Represents command object for handling REPORT command sent to robot
    class ReportCommand
      def initialize robot, _
        @robot = robot
      end

      def call
        robot.build_view(Views::RobotView).to_s
      end

      private
        attr_reader :robot
    end
  end
end
