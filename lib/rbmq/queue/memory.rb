module Rbmq
  module Queue
    class Memory
      # @topics = {'dest1' => {enqueued: 2,
      #                       dequeued: 5,
      #                       messages: [frame1, frame2]},
      #            'dest2' => {enqueued: 1,
      #                       dequeued: 4,
      #                       messages: [frame3]}}
      attr_reader :topics
      def initialize
        set_default_topics
        Rbmq.logger.info 'MemoryQueue initialized'
      end

      def dequeue dest
        topics[dest][:messages].shift
      end

      def enqueue dest, frame
        topics[dest][:messages] << frame
      end

      def set_default_topics
        @topics = Hash.new do |h, k|
          h[k] = Hash.new {|h, k| (h[k] = Array.new) if k.eql?(:messages) }
        end
      end
    end
  end
end
