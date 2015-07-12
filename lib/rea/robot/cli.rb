module Rea
  module Robot
    class Cli

      def start!
        STDIN.each do |line|
          res = handle_input line.chomp.downcase
          break unless res
          puts res unless res.empty?
        end
      end

      def handle_input input
        return nil if input == 'exit'
        return '0,1,NORTH' if input == 'report'
        ''
      end
    end
  end
end
