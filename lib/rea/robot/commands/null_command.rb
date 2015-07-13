module Rea
  module Robot
    # Represents command object for handling empty (default) command
    class NullCommand
      def initialize _, _
      end

      def call
        ''
      end
    end
  end
end
