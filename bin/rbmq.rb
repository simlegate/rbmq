#!/usr/bin/env ruby

require 'eventmachine'

require_relative '../lib/rbmq'

EventMachine.run do
  Rbmq::QueueManager.current = Rbmq::QueueManager.new(Rbmq::Queue::Memory::Runner.new)
  EventMachine.start_server("0.0.0.0", 61613,Rbmq::Server::EventMachine)
  
  Signal.trap("INT")  { EventMachine.stop }
  Signal.trap("TERM") { EventMachine.stop }
end
