require_relative "memory/messages"
require_relative "memory/connections"

module Rbmq
  module Queue
    module Memory
      class Runner
        attr_reader :messages, :connections
        def initialize
          @messages = Memory::Messages.new
          @connections = Memory::Connections.new
          Rbmq.logger.info 'MemoryQueue initialized'
        end

        def dequeue dest
          @messages.pop dest
        end

        def enqueue dest, frame
          @messages.push dest, frame
        end

        def subscribe dest, sub_id, connection
          @connections.push dest, sub_id, connection
        end

        def unsubscribe dest, sub_id
          @connections.pop dest, sub_id
        end

        def send_msgs dest
          messages = @messages.topics[dest]
          connections = @connections.topics[dest]
          connections.each do |connection|
            messages.each do |message|
              message.command = "MESSAGE"
              connection[:connection].send_data(message.to_str)
              Rbmq.logger.info "send data to #{connection[:connection]}"
              Rbmq.logger.info "\n#{message.to_str}"
              messages.delete(message)
            end
          end
        end
      end
    end
  end
end
