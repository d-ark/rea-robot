require "rea/robot/views/board_cell_view"
require "rea/robot/views/direction_view"

module Rea
  module Robot
    module Views
      # Represents robot position data as a string
      class RobotView
        def initialize  position
          @position = position
        end

        def to_s
          return '' if empty?
          "#{cell_view},#{direction_view}"
        end


        private
          attr_reader :position

          def empty?
            !position || cell_view.empty? || direction_view.empty?
          end

          def cell_view
            position[:cell].build_view(BoardCellView).to_s
          end

          def direction_view
            position[:direction].build_view(DirectionView).to_s
          end

      end
    end
  end
end
