module Rea
  module Robot
    class PlaceCommand
      def initialize robot, args
        @robot = robot
        parse_argument Array(args).first.to_s || ''
      end

      def call
        @robot.place @cell, @direction
        ''
      end

      private

      def parse_argument str
        left,right,direction = str.split ','
        @cell = BoardCellFactory.build left,right
        @direction = DirectionFactory.build direction
      end
    end
  end
end
