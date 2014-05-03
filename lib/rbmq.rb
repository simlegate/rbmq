require_relative "rbmq/version"

require_relative "core_ext/hash"
require_relative "core_ext/string"

require_relative "rbmq/errors"

require_relative "rbmq/utils"
require_relative "rbmq/frame_structure"
require_relative "rbmq/frame_parser"
require_relative "rbmq/frame_factory"
require_relative "rbmq/server"
require_relative "rbmq/models"
require_relative "rbmq/authenticator"
require_relative "rbmq/dispatcher"
require_relative "rbmq/queue"
require_relative "rbmq/queue_manager"

require_relative "rbmq/cli"

module Rbmq

  ROOT = File.expand_path("../../", __FILE__).to_s

  VALID_COMMAND_COLLECTIONS = %w(ERROR SEND CONNECT)

  def self.logger
    Rbmq::Logger.instance
  end
end

require_relative "rbmq/logger"
