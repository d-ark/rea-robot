module Rea
  module Robot
    module Views
      # Represents direction as a string
      class DirectionView
        def initialize direction
          @direction = direction
        end

        def to_s
          direction.to_s.upcase
        end

        private
          attr_reader :direction
      end
    end
  end
end
