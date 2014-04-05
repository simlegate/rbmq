module Rbmq
  module Server
    module EventMachine
      def post_init
        puts "-- someone connected to the echo server!"
        Rbmq.logger.info "A client has connected..."
      end

      def receive_data data
        Rbmq.logger.info 'receive request from client'
        Rbmq.logger.info data
        response_frame = Rbmq::Dispatcher.new(Rbmq::FrameBuilder.new(data).frame).run
        Rbmq.logger.info 'send response form server'
        Rbmq.logger.info response_frame.to_s
        send_data response_frame.to_s
        # => close_connection if data =~ /quit/i
      end

      def unbind
        puts "-- someone disconnected from the echo server!"
        Rbmq.logger.info "client has left"
      end
    end
  end
end
