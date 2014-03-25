module Rbmq
  module Server
    module EventMachine
      def post_init
        puts "-- someone connected to the echo server!"
      end

      def receive_data data
        puts data
        frame = FrameStructure::Frame.new('CONNECTED', {version: 1}, "\x00")
        send_data frame.to_s
        close_connection if data =~ /quit/i
      end

      def unbind
        puts "-- someone disconnected from the echo server!"
      end
    end
  end
end
