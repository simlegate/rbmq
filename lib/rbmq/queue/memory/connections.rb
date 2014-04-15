module Rbmq
  module Queue
    module Memory
      class Connections
        # @topics = {'dest1' => [{sub_id: '0001', connection: con1}, {sub_id: '0002', connection: con2}],
        #            'dest2' => [{sub_id: '0003', connection: con3}}
        attr_accessor :topics
        def initialize
          set_default_topics
        end

        def push dest, sub_id, connection
          topics[dest] << {sub_id: sub_id, connection: connection}
        end

        def pop dest, sub_id
          topics[dest].delete_if do | connection |
            connection[:sub_id].eql?(sub_id)
          end
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
