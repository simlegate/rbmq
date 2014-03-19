module Rbmq
  puts constants
  class FrameBuilder

    def initialize frame_text
      @text = frame_text
    end

    private
    def parse_command
      unless FrameStructure::Command.new(@text.each_line.first).upcase?
        raise Errors::InvalidLowerCaseCommand
      end
      unless FrameStructure::Command.new(@text.each_line.first).included?
        raise Errors::InvalidServerCommand
      end
    end
  end
end
