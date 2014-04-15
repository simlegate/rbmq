module Rbmq
  module Queue
    module Memory
      class Runner
        attr_reader :topics, :messages, :connections
        def initialize
          @messages = Mssages.new
          @connections = Connections.new
          Rbmq.logger.info 'MemoryQueue initialized'
        end

        def dequeue dest
          @messages.pop dest
        end

        def enqueue dest, frame
          @messages.push dest, frame
        end

        def subscribe dest, sub_id, connection
          @connections.push dest, connection
        end

        def unsubscribe dest, sub_id
          @connections.pop dest, sub_id
        end

        def send_msgs dest
          messages = @messages.topics[dest]
          connections = @connections.topics[dest]
          connections.each do |connection|
            messages.each do |message|
              connection.send_data(message.to_str)
            end
          end
        end
      end
    end
  end
end
