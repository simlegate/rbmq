module Rbmq
  module Models
    class User
      def self.auth username, passwd
        User.new if username.eql?(passwd)
      end
    end
  end
end
