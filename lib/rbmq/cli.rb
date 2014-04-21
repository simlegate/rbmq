require 'thor'
module Rbmq
  class CLI < Thor
    map "-s" => :server, "-v" => :version

    method_option :host, :aliases => "-h", :desc => "Default: 0.0.0.0"
    method_option :port, :type => :numeric, :aliases => "-p", :desc => "Default: 61613"

    desc "server", "Serve your rbmq"
    def server host="0.0.0.0", port=61613
      EventMachine.run do
        Rbmq::QueueManager.current = Rbmq::QueueManager.new(Rbmq::Queue::Memory::Runner.new)
        EventMachine.start_server(host, port, Rbmq::Server::EventMachine)

        Signal.trap("INT")  { EventMachine.stop }
        Signal.trap("TERM") { EventMachine.stop }
      end
    end

    desc "version", "Display Rbmq gem version"
    def version
      puts Rbmq::VERSION
    end

    desc "doctor", "doctor"
    def doctor
    end
  end
end
