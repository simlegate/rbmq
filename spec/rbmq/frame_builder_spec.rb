require 'spec_helper'

module Rbmq
  describe FrameBuilder do

    let(:base_frame) {File.open(load_fixture('base_frame')).read}
    let(:builder) { Rbmq::FrameBuilder.new(base_frame) }
    context 'parse command from frame text' do
      it "should not raise error when command is capitalized" do
        expect(builder.command).to eq('COMMAND')
      end
    end

    context "parse header entries from frame text" do
      it 'should be instance of Array' do
        expect(builder.header_entries).to eq(['header1:value1', 'header2:value2'])
      end
    end

    context "parse body from frame text" do
      it 'should be string of Array' do
        expect(builder.body).to eq('Body^@')
      end
    end
  end
end
