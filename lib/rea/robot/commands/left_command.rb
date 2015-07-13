module Rea
  module Robot
    class LeftCommand
      def initialize robot, _
        @robot = robot
      end

      def call
        @robot.rotate 'left'
        ''
      end
    end
  end
end
