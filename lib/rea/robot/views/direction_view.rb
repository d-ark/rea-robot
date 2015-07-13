module Rea
  module Robot
    module Views
      class DirectionView
        def self.build direction
          direction.build_view self
        end

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
