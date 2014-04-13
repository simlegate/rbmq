module Rbmq
  module Utils
    class FrameFormatChecker
      include Validator

      def initialize frame_builder
        @builder = frame_builder
      end

      def run
        check_command
        check_headers
        check_body
      end

      private
      def check_command
        raise Errors::InvalidLowerCaseCommand unless @builder.command.upcase?
        raise Errors::InvalidServerCommand unless valid_command?(@builder.command)
      end

      def check_headers
        if @builder.command.eql?("SEND")
          raise 'send frame should include dest' unless @builder.header_entries.has_key?(:destination)
        end
      end

      def check_body
      end
    end
  end
end
