require 'rea/robot/domain/left_rotation'
require 'rea/robot/domain/right_rotation'
require 'rea/robot/domain/null_rotation'

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
