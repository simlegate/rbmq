require 'spec_helper'

module Rbmq
  describe ".Auth" do
    it "should be nil when auth fail" do
      expect(Models::User.auth('foo', 'foo1')).to be_nil
    end

    it "should get User instance when auth successfully" do
      expect(Models::User.auth('foo', 'foo')).to be_instance_of(Models::User)
    end
  end
end
