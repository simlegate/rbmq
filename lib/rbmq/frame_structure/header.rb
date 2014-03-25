module Rbmq
  module FrameStructure
    class Header
      attr_accessor :key, :value
      def initialize key, value
        @key, @value = key, value
      end

      def to_s
        [key, value].join(':')
      end
    end
  end
end
