require 'rea/robot/left_rotation'
require 'rea/robot/right_rotation'
require 'rea/robot/null_rotation'

module Rea
  module Robot
    class Rotation

      def self.build(side)
        STRATEGIES[side].new
      end

    private

      STRATEGIES = {
        'left' => LeftRotation,
        'right' => RightRotation
      }
      STRATEGIES.default = NullRotation

    end
  end
end
