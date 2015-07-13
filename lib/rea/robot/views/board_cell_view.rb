module Rea
  module Robot
    module Views
      # Represents BoardCell as a string
      class BoardCellView
        def initialize cell
          @cell = cell
        end

        def to_s
          return '' unless cell
          "#{left},#{top}"
        end

        private
          attr_reader :cell

          def left
            cell[:left]
          end

          def top
            cell[:top]
          end
      end
    end
  end
end
