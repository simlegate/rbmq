module Rbmq
  module Errors
    
    class InvalidLowerCaseCommand < RuntimeError
      def message
	'Every word of command must be capitalized'
      end
    end

    class InvalidServerCommand < RuntimeError
      def message
	"Server doesn't support the command"
      end
    end
  end
end
