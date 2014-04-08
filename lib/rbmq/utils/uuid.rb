require 'securerandom'
module Rbmq
  module Utils
    module UUID
      def general_uuid
        SecureRandom.uuid
      end
    end
  end
end
