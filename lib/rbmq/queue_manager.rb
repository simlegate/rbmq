module Rbmq
  class QueueManager
    attr_accessor :queue
    def initialize queue
      @queue = queue
    end

    def dequeue dest
      @queue.dequeue dest
    end

    def enqueue dest, frame
      @queue.enqueue dest, frame
    end

    def subscribe dest, sub_id, connection
      @queue.subscribe dest, sub_id, connection
    end

    def unsubscribe dest, sub_id
      @queue.unsubscribe dest, sub_id
    end

    def send_msgs dest
      @queue.send_msgs dest
    end

    class << self
      attr_accessor :current
    end
  end
end
