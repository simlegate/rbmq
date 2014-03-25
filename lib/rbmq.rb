require "rbmq/version"

require "core_ext/hash"
require "core_ext/string"


require_relative "rbmq/frame_structure"

require_relative "rbmq/frame_builder"

require_relative "rbmq/errors"

require_relative "rbmq/server"


module Rbmq
  VALID_COMMAND_COLLECTIONS = %w(ERROR SEND CONNECT)
end
