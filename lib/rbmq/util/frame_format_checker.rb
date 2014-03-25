module Rbmq
  module Util
    class FrameFormatChecker
      def initialize frame_text
        @builder = FrameBuilder.new frame_text
      end

      def run
        check_command
        check_headers
        check_body
      end

      private
      def check_command
        command = FrameStructure::Command.new(@builder.command)
        raise Errors::InvalidLowerCaseCommand unless command.upcase?
        raise Errors::InvalidServerCommand unless command.included?
      end

      def check_headers
      end

      def check_body
      end
    end
  end
end
