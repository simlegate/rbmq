require 'eventmachine'
module Rbmq
  class Dispatcher
    include Utils::UUID

    def initialize request_frame
      @request_frame = request_frame
      @request_frame_headers = @request_frame.headers
    end

    def run
      # auth
      Authenticator.new(@request_frame_headers[:login],
        @request_frame_headers[:passcode]).run
      dest = @request_frame.headers[:destination]
      case @request_frame.command
      when "CONNECT"
        FrameStructure::Frame.new('CONNECTED', {version: 1.0}, "\x00")
      when "SEND"
        QueueManager.current.enqueue(dest, @request_frame)
        ::EM.defer do
          QueueManager.current.send_msgs dest
        end
        receipt
      when "SUBSCRIBE"
        QueueManager.current.subscribe(dest, @request_frame.headers[:id], @connection)
        receipt
      when "UNSUBSCRIBE"
        QueueManager.current.unsubscribe(dest, @request_frame.headers[:id])
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
    rescue => e
      Rbmq::FrameStructure::Frame.new('ERROR',
        {}, e)
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
