module Rbmq
  module Errors

    class InvalidLowerCaseCommand < StandardError
      def message
        'Every word of command must be capitalized'
      end
    end

    class InvalidServerCommand < StandardError
      def message
        "Server doesn't support the command"
      end
    end

    class FailedAuth < StandardError
      def message
        "Auth Fail"
      end
    end
  end
end
