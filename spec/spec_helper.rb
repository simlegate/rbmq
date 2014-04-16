# => require_relative '../lib/rbmq'

require 'rbmq'

ROOT = File.expand_path('../..', __FILE__)

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}


def load_fixture path
  File.join(ROOT, 'spec/fixtures/'+path).to_s
end

RSpec.configure do |config|
  config.before(:suite) do
  end

  config.before(:each) do
    Rbmq::QueueManager.current = Rbmq::QueueManager.new(Rbmq::Queue::Memory::Runner.new)
  end

  config.after(:each) do
    Rbmq::QueueManager.current = nil
  end
end
