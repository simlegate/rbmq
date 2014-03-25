require 'spec_helper'

module Rbmq
  module FrameStructure
    describe 'A frame consists of' do
      let(:frame) { Frame.new('CONNECT', {'accept-version' =>  1.2}, '^@') }
      context 'command' do
        it 'should be instance of String' do
          expect(frame.command).to eq('CONNECT')
        end

        it 'should be capital' do
        end
      end

      context 'header entries' do
        it 'should be instance of Array' do
          expect(frame.headers).to be_an_instance_of(Array)
          frame.headers.map do |header|
            expect(header).to be_an_instance_of(Header)
          end
        end
      end

      context 'body' do
        it 'should be instance of String' do
          expect(frame.body.to_s).to eq("^@")
        end
      end

      it 'should get frame' do
        expect(frame.to_s).to eq("CONNECT\naccept-version:1.2\n\n^@")
      end
    end

  end
end
