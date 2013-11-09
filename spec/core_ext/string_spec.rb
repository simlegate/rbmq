# encoding: utf-8
require 'spec_helper'
describe Hash do
  context '#upcase?' do
    it 'should be true when all letters of string' do
      expect('AAAAA'.upcase?).to be_true
    end

    it 'should be false when string includes down case' do
      expect('AaAAA'.upcase?).to be_false
    end

    it 'should not change itself' do
      str = 'string' and str.upcase?
      expect(str).to eq('string')
    end

    it 'should be false when include other letters not in [A-Z]' do
      expect('字符串'.upcase?).to be_false
      expect('マップ'.upcase?).to be_false
    end
  end
end
