require "rbmq/version"

require "core_ext/hash"
require "core_ext/string"

require_relative "rbmq/utils"
require_relative "rbmq/frame_structure"
require_relative "rbmq/frame_builder"
require_relative "rbmq/errors"
require_relative "rbmq/server"
require_relative "rbmq/dispatcher"
require_relative "rbmq/logger"
require_relative "rbmq/queue"
require_relative "rbmq/queue_manager"

module Rbmq
  ROOT = File.expand_path("../../", __FILE__).to_s

  VALID_COMMAND_COLLECTIONS = %w(ERROR SEND CONNECT)

  def self.logger
    Rbmq::Logger.new.instance
  end
end
