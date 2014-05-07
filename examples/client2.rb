
require 'eventmachine'
module StompClient
  include EM::Protocols::Stomp

  def connection_completed
    p 'producer client is running ....'
    connect :login => '', :passcode => ''
  end

  def receive_msg msg
    if msg.command == "CONNECTED"
      p 'send a message to /some/topic ..'
      send "/some/topic", "Hello World"
    elsif msg.command == "RECEIPT"
      p 'client has left'
      close_connection_after_writing
      EM.stop
    end
  end

  def disconnect
    send_frame "DISCONNECT"
  end
end

EM.run{
  EM.connect 'localhost', 61613, StompClient
}
