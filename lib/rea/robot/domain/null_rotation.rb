module Rea
  module Robot
    # Represents rotation stratagy without effect
    class NullRotation
      def rotate direction
        direction
      end
    end
  end
end
