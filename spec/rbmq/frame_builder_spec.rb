require 'spec_helper'

module Rbmq
  describe FrameBuilder do

    context 'parse command from frame text' do
      it "should not raise error when command is capitalized" do
        builder = FrameBuilder.new('ERROR')
        expect{builder.send(:parse_command)}.not_to raise_error
      end

      it "should raise error when command isn't capitalized" do
        builder = FrameBuilder.new('error')
        expect{builder.send(:parse_command)}.to raise_error(Errors::InvalidLowerCaseCommand)
      end

      it "should not raise error when command exists" do
        builder = FrameBuilder.new('ERROR')
        expect{builder.send(:parse_command)}.not_to raise_error
      end

      it "should raise error when command doesn't exist" do
        builder = FrameBuilder.new('INVALIDCOMMAND')
        expect{builder.send(:parse_command)}.to raise_error(Errors::InvalidServerCommand)
      end
    end
  end
end
