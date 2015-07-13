module Rea
  module Robot
    # Represents where robot is directed to
    class Direction
      def initialize direction
        @direction = direction
      end

      def == other
        self.direction == other.direction
      end

      def rotate_right
        DirectionFactory.build next_direction
      end

      def rotate_left
        DirectionFactory.build prev_direction
      end

      def to_s
        direction.upcase
      end

      def build_view view_class
        view_class.new direction
      end

      def move cell
        cell.neighbour *DIRECTIONS_STEPS[direction]
      end

      def valid?
        DIRECTIONS.include? direction
      end

      protected
        attr_reader :direction

      private

        DIRECTIONS_STEPS = {
          'north' => [ 0, 1],
          'east' =>  [ 1, 0],
          'south' => [ 0,-1],
          'west' =>  [-1, 0]
        }

        DIRECTIONS = DIRECTIONS_STEPS.keys


        def next_direction
          DIRECTIONS[ ( DIRECTIONS.find_index(direction) + 1 ) % DIRECTIONS.size]
        end

        def prev_direction
          DIRECTIONS[ ( DIRECTIONS.find_index(direction) - 1 ) % DIRECTIONS.size]
        end


    end
  end
end
