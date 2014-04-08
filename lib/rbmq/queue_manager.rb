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

    class << self
      attr_accessor :current
    end
  end
end
