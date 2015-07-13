require 'rea/robot'

module Rea
  module Robot
    # Represents console client for Application
    class Cli
      def initialize
        @application = Application.new
      end

      def start
        STDIN.each do |line|
          render handle_input line
          break if application.closed?
        end
      end

      private
        attr_reader :application

        def render data
          puts data unless data.empty?
        end

        def handle_input input
          application.perform_command *input.chomp.downcase.split(/\s/)
        end
    end
  end
end
