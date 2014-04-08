require 'spec_helper'
module Rbmq
  describe 'Dispatcher' do
    it 'dispatch SEND frame' do
      dispatcher = Dispatcher.new(FrameStructure::Frame.new('SEND', {a: 1}, "\x00"))
      expect(dispatcher.run.command).to eq("RECEIPT")
    end
  end
end
