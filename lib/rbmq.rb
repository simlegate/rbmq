require "rbmq/version"
require "core_ext/hash"
require "core_ext/string"

require "rbmq/errors"

require "rbmq/frame_structure"
require "rbmq/frame_builder"

module Rbmq
  VALID_COMMAND_COLLECTIONS = %w(ERROR SEND)
end
