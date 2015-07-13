module Rea
  module Robot
    class RightCommand
      def initialize robot, _
        @robot = robot
      end

      def call
        @robot.rotate 'right'
        ''
      end
    end
  end
end
