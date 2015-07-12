require 'rea/robot/board'
require 'rea/robot/board_cell'
require 'rea/robot/robot'

module Rea
  module Robot
    class Application

      def initialize
        @robot = Robot.new Board.new(5,5)
      end

      def perform_command command='', *args
        case command
        when 'exit'
          close
          ''
        when 'report'
          robot.position
        when 'move'
          robot.move
          ''
        when 'place'
          x,y,direction = args.first.split ','
          robot.place BoardCell.new(x.to_i, y.to_i), direction
          ''
        else
          ''
        end
      end

      def closed?
        !!closed
      end

      private

        attr_reader :robot, :closed

        def close
          @closed = true
        end

    end
  end
end
