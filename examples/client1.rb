
require 'eventmachine'
module StompClient
  include EM::Protocols::Stomp

  def connection_completed
    p 'consumer client is running ....'
    p 'the subscribed topic is [/some/topic]'
    p 'waiting for a message from server ...'
    p '====================================='
    connect :login => '', :passcode => ''
  end

  def receive_msg msg
    if msg.command == "CONNECTED"
      subscribe '/some/topic', {id: 00000000}
    elsif msg.command == "MESSAGE"
      p "Receive a message: #{msg.body}"
    end
  end

  def disconnect
    send_frame "DISCONNECT"
  end
end

EM.run{
  EM.connect 'localhost', 61613, StompClient
}
