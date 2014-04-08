# encoding: UTF-8

module Rbmq
  class FrameParser
    include Utils::Convertor

    def initialize frame_text
      @text = frame_text
    end

    def command
      to_enum.first
    end

    def header_entries
      to_hash_of to_enum[1..-3]
    end

    def body
      to_enum.last
    end

    private
    def to_enum
      @enum ||= @text.lines.map(&:chomp)
    end
  end
end
