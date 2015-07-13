module Rea
  module Robot
    # Represents handling commands sent to robot
    class Application

      def initialize
        @robot = Robot.new(
          Board.new(5,5),
          BoardCellFactory.build(nil, nil),
          DirectionFactory.build(nil)
        )
      end

      def perform_command command='', *args
        close and return '' if command == 'exit'
        COMMANDS[command].new(robot, args).call
      end

      def closed?
        !!closed
      end

      private

        attr_reader :robot, :closed

        def close
          @closed = true
        end

        COMMANDS = {
          'place' => PlaceCommand,
          'left' => LeftCommand,
          'right' => RightCommand,
          'move' => MoveCommand,
          'report' => ReportCommand
        }
        COMMANDS.default = NullCommand
    end
  end
end
