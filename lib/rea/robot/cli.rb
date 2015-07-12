require 'rea/robot/application'

module Rea
  module Robot
    class Cli
      def initialize
        @application = Rea::Robot::Application.new
      end

      def start
        STDIN.each do |line|
          res = handle_input line
          break if @application.closed?
          puts res unless res.empty?
        end
      end

      def handle_input input
        @application.perform_command *input.chomp.downcase.split(/\s/)
      end
    end
  end
end
