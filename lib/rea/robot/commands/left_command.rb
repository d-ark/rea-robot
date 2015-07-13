module Rea
  module Robot
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
