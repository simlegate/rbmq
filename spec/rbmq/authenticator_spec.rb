require 'spec_helper'
module Rbmq
  describe "Authenticator" do
    it "should raise error when auth fail" do
      authenticator = Authenticator.new('foo', 'foo1')
      expect{authenticator.run}.to raise_error(Errors::FailedAuth)
    end
  end
end
