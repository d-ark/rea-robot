module Rea
  module Robot
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
