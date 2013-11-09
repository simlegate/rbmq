module Rbmq
  class FrameBuilder

    def initialize frame_text
      @text = frame_text
    end

    private
    def parse_command
      raise Errors::InvalidLowerCaseCommand unless FrameStructure::Command.new(@text.each_line.first).upcase?
      raise Errors::InvalidServerCommand unless FrameStructure::Command.new(@text.each_line.first).included?
    end
  end
end
