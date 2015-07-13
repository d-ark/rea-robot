require "rea/robot/domain/board_cell"
require "rea/robot/domain/null_board_cell"

module Rea
  module Robot
    class BoardCellFactory
      def self.build left, top
        return NullBoardCell.new unless left.to_i.to_s == left.to_s
        return NullBoardCell.new unless top.to_i.to_s  == top.to_s
        BoardCell.new left.to_i, top.to_i
      end
    end
  end
end
