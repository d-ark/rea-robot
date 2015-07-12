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
          # TODO Refactor this !
          x,y,direction = (args.first || '').split ','
          if x.to_i.to_s == x && y.to_i.to_s == y
            cell = BoardCell.new(x.to_i, y.to_i)
            robot.place cell, direction
          end
          ''
        when 'left'
          robot.rotate 'left'
          ''
        when 'right'
          robot.rotate 'right'
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
