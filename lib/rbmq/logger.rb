require 'logger'

module Rbmq
  class Logger

    DEFAULT_LOG_PATH = ROOT+"/log/log"
    DEFAULT_DATETIME_FORMAT = "%Y-%m-%d %H:%M:%S"

    def self.instance path=nil, datetime_format=nil
      path = path || DEFAULT_LOG_PATH
      datetime_format = datetime_format || DEFAULT_DATETIME_FORMAT
      @logger = ::Logger.new(@log_path)
      @logger.datetime_format = "%Y-%m-%d %H:%M:%S"
      @logger
    end
  end
end
