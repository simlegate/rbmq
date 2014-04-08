# encoding: UTF-8

module Rbmq
  class FrameBuilder
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

    def frame
      frame_format_checker.run
      @frame ||= Rbmq::FrameStructure::Frame.new(command, header_entries, body)
    end

    private
    def to_enum
      @enum ||= @text.lines.map(&:chomp)
    end

    def frame_format_checker
      Utils::FrameFormatChecker.new(self)
    end
  end
end
