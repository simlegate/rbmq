module Rbmq
  module Validator
    def valid_command? cmd
      VALID_COMMAND_COLLECTIONS.include?(cmd)
    end
  end
end
