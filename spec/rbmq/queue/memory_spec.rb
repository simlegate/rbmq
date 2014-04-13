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

    context "#dequeue" do
      it "should be nil when dest do not exist" do
        expect(queue.dequeue("/path/to")).to eq(nil)
      end

      it "should return Frame when dest exist" do
        queue.topics["/path/to"][:messages] = Array(test_frame)
        expect(queue.dequeue("/path/to")).to be_an_instance_of(FrameStructure::Frame)
      end
    end

    context "#enqueue" do
      it "should enqueue successfully" do
        queue.enqueue("/path/to", test_frame)
        expect(queue.topics["/path/to"][:messages].count).to eq(1)
        expect(queue.topics["/path/to"][:messages].first).to be_an_instance_of(FrameStructure::Frame)
        queue.enqueue("/path/to2", test_frame)
        expect(queue.topics["/path/to2"][:messages].count).to eq(1)
        expect(queue.topics["/path/to2"][:messages].first).to be_an_instance_of(FrameStructure::Frame)
        expect(queue.topics).to have_key("/path/to")
        expect(queue.topics).to have_key("/path/to2")
      end
    end
  end
end
