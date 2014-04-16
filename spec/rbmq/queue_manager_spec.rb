require 'spec_helper'

module Rbmq
  # => Rbmq::QueueManager.current = Rbmq::QueueManager.new(Rbmq::Queue::Memory.new)
  describe "QueueManager" do
    let(:test_frame) { FrameStructure::Frame.new('SEND', {}, "") }
    context "Memory Queue" do
      it 'current queue manager is memory' do
        expect(QueueManager.current).to be_instance_of(QueueManager)
      end

      #it "should can dequeue" do
      #  QueueManager.current.queue.topics["/path/to"][:messages] = Array(test_frame)
      #  expect(QueueManager.current.dequeue("/path/to")).to be_instance_of(FrameStructure::Frame)
      #end

      #it "should can enqueue" do
      #  QueueManager.current.enqueue("/path/to", test_frame)
      #  expect(QueueManager.current.queue.topics["/path/to"][:messages].first).
      #    to be_instance_of(FrameStructure::Frame)
      #end
    end
  end
end
