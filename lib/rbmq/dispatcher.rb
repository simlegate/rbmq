module Rbmq
  class Dispatcher
    def initialize request_frame
      @request_frame = request_frame
    end

    def run
      case @request_frame.command
      when "CONNECT"
        FrameStructure::Frame.new('CONNECTED', {version: 1}, "\x00")
      when "SEND"
        FrameStructure::Frame.new('CONNECTED', {version: 1}, "\x00")
      when "SUBSCRIBE"
        FrameStructure::Frame.new('CONNECTED', {version: 1}, "\x00")
      when "UNSUBSCRIBE"
        FrameStructure::Frame.new('CONNECTED', {version: 1}, "\x00")
      when "ACK"
        FrameStructure::Frame.new('CONNECTED', {version: 1}, "\x00")
      when "NACK"
        FrameStructure::Frame.new('CONNECTED', {version: 1}, "\x00")
      when "BEGIN"
        FrameStructure::Frame.new('CONNECTED', {version: 1}, "\x00")
      when "COMMIT"
        FrameStructure::Frame.new('CONNECTED', {version: 1}, "\x00")
      when "ABORT"
        FrameStructure::Frame.new('CONNECTED', {version: 1}, "\x00")
      when "DISCONNECT"
        FrameStructure::Frame.new('CONNECTED', {version: 1}, "\x00")
      else
        FrameStructure::Frame.new('ERROR', {version: 1}, "\x00")
      end
    end

    def response_frame
    end
  end
end
