require 'spec_helper'

module Rbmq
  module FrameStructure
    describe 'A frame consists of' do
      let(:frame) { Frame.new('CONNECT', {a:1, b:2}, '^@') }
      context 'command' do
        it 'should be instance of String' do
          expect(frame.command).to eq('CONNECT')
        end

        it 'should be capital' do
        end
      end

      context 'header entries' do
        it 'should be instance of Hash' do
          expect(frame.headers).to be_an_instance_of(Hash)
        end
      end

      context 'body' do
        it 'should be instance of String' do
          expect(frame.body.to_s).to eq("^@")
        end
      end

      it 'should get frame' do
        expect(frame.to_str).to eq("CONNECT\na:1\nb:2\n\n^@")
      end
    end

  end
end
