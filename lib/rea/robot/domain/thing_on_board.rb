module Rea
  module Robot
    class ThingOnBoard
      def initialize thing, cell
        @thing = thing
        @cell = cell
      end

      private

        attr_reader :thing, :cell
    end
  end
end
