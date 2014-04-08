require 'spec_helper'
module Rbmq
  describe "Queue::Memory" do
    let(:queue) { Queue::Memory.new }
    let(:test_frame) { FrameStructure::Frame.new('SEND', {}, "") }
    it "default value of @topic" do
      expect(queue.topics["/path/to"]).to eq({})
      expect(queue.topics["/path/to"][:messages]).to eq([])
      expect(queue.topics["/path/to"][:enqueued]).to eq(nil)
    end

    it "should be nil when dest do not exist" do
      expect(queue.dequeue("/path/to")).to eq(nil)
    end

    it "should return Frame when dest exist" do
      queue.topics["/path/to"][:messages] = Array(test_frame)
      expect(queue.dequeue("/path/to")).to be_an_instance_of(FrameStructure::Frame)
    end

    it "should enqueue" do
      queue.enqueue("/path/to", test_frame)
      expect(queue.dequeue("/path/to")).to be_an_instance_of(FrameStructure::Frame)
    end
  end
end
