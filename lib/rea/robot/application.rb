module Rea
  module Robot
    class Application

      def perform_command command='', *args
        case command
        when 'exit'
          @closed = true
          ''
        when 'report'
          '0,1,NORTH'
        else
          ''
        end
      end

      def closed?
        !!@closed
      end

    end
  end
end
