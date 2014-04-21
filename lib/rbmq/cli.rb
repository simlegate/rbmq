require 'thor'
module Rbmq
  class CLI < Thor
    map "-v" => :version

    desc "version", "Display Rbmq gem version"
    def version
      puts Rbmq::VERSION
    end
  end
end
