module Rbmq
  module FrameStructure
    class Command

      def initialize content
        @content = content
      end

      def upcase?
        @content.chomp.upcase?
      end

      def included?
        VALID_COMMAND_COLLECTIONS.include? @content.chomp
      end
    end
  end
end
