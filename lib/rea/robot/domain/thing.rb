module Rea
  module Robot
    class Thing
      def initialize name
        @name = name
      end

      def == other
        self.name == other.name
      end

      protected
        attr_reader :name
    end
  end
end
