module Rea
  module Robot
    class Direction
      def initialize direction
        @direction = direction
      end

      def == other
        self.direction == other.direction
      end

      def rotate_right
        self.class.new next_direction
      end

      def rotate_left
        self.class.new prev_direction
      end

      def to_s
        direction.upcase
      end

      def move cell
        cell.neighbour DELTA_X[direction], DELTA_Y[direction]
      end

      def valid?
        DIRECTIONS.include? direction
      end

      protected
        attr_reader :direction

      private

        DIRECTIONS = ['north', 'east', 'south', 'west']
        DELTA_X = {
          'north' => 0,
          'east' => 1,
          'south' => 0,
          'west' => -1
        }
        DELTA_Y = {
          'north' => 1,
          'east' => 0,
          'south' => -1,
          'west' => 0
        }


        def next_direction
          DIRECTIONS[ ( DIRECTIONS.find_index(direction) + 1 ) % DIRECTIONS.size]
        end

        def prev_direction
          DIRECTIONS[ ( DIRECTIONS.find_index(direction) - 1 ) % DIRECTIONS.size]
        end


    end
  end
end
