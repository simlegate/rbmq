module Rbmq
  class Dispatcher
    include Utils::UUID

    def initialize request_frame
      @request_frame = request_frame
    end

    def run
      case @request_frame.command
      when "CONNECT"
        FrameStructure::Frame.new('CONNECTED', {version: 1.0}, "\x00")
      when "SEND"
        QueueManager.current.enqueue(
          @request_frame.headers[:destination], @request_frame)
        # => send msgs
        # => EM.defer do
        # => end
        receipt
      when "SUBSCRIBE"
        QueueManager.current.subscribe(@request_frame.headers[:destination],
          @request_frame.headers[:id], @connection)
        receipt
      when "UNSUBSCRIBE"
        QueueManager.current.unsubscribe(@request_frame.headers[:destination],
          @request_frame.headers[:id])
        receipt
      when "ACK"
        receipt
      when "NACK"
        receipt
      when "BEGIN"
        receipt
      when "COMMIT"
        receipt
      when "ABORT"
        receipt
      when "DISCONNECT"
        # close current socket connection
        @connection.close_connection_after_writing
        receipt
      else
        FrameStructure::Frame.new('ERROR', {version: 1.0}, "\x00")
      end
    end

    def connection= connection
      @connection = connection
    end

    private
    def receipt
      Rbmq::FrameStructure::Frame.new('RECEIPT',
        {:'receipt-id' => general_uuid, version: 1.0}, "\x00")
    end
  end
end
