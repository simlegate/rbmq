module Rbmq
  module FrameStructure
    class Body
      attr_accessor :content
      def initialize content
        @content = content
      end

      def to_s
        content
      end
    end

  end
end
