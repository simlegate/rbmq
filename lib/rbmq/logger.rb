require 'logger'

module Rbmq
  class Logger

    DEFAULT_LOG_PATH = Rbmq.root+"/log/log"
    DEFAULT_DATETIME_FORMAT = "%Y-%m-%d %H:%M:%S"

    def self.instance path=nil, datetime_format=nil
      path ||= DEFAULT_LOG_PATH
      datetime_format ||= DEFAULT_DATETIME_FORMAT
      @logger = ::Logger.new(path)
      @logger.datetime_format = "%Y-%m-%d %H:%M:%S"
      @logger
    end
  end
end
