# => require_relative '../lib/rbmq'

require 'rbmq'

ROOT = File.expand_path('../..', __FILE__)

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
