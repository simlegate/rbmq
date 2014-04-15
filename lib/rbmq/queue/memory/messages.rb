module Rbmq
  module Queue
    module Memory
      class Messages
        # @topics = {'dest1' => [frame1, frame2],
        #            'dest2' => [frame3]}
        attr_accessor :topics
        def initialize
          set_default_topics
        end

        def push dest, frame
          topics[dest] << frame
        end

        def pop dest
          topics[dest].shift
        end

        private
        def set_default_topics
          @topics = Hash.new do |h, k|
            h[k] = Array.new
          end
        end
      end
    end
  end
end
