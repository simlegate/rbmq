require 'logger'

module Rbmq
  class Logger
    def initialize
      @log_path = ROOT+"/log/log"
      @logger = ::Logger.new(@log_path)
      @logger.datetime_format = "%Y-%m-%d %H:%M:%S"
    end

    def instance
      @logger
    end
  end
end
