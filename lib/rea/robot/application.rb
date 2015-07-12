require 'rea/robot/board'
require 'rea/robot/board_cell_factory'
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
          cell = BoardCellFactory.build x, y
          robot.place cell, direction
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
