require 'rea/robot'

module Rea
  module Robot
    class Cli
      def initialize
        @application = Rea::Robot::Application.new
      end

      def render data
        puts data unless data.empty?
      end

      def start
        STDIN.each do |line|
          render handle_input line
          break if @application.closed?
        end
      end

      def handle_input input
        @application.perform_command *input.chomp.downcase.split(/\s/)
      end
    end
  end
end
