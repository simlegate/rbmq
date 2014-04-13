module Rbmq
  class FrameFactory
    def self.produce_by_str str
      parser = FrameParser.new(str)
      FrameStructure::Frame.new(parser.command, parser.header_entries, parser.body)
    end

    def frame
      frame_format_checker.run
      @frame ||= FrameStructure::Frame.new(command, header_entries, body)
    end

    def frame_format_checker
      Utils::FrameFormatChecker.new(self)
    end
  end
end
