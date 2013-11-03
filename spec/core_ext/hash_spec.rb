require 'spec_helper'

describe Hash do
  context '#symbolize_keys!' do
    let(:hash) {{'a' => 2, 'b' => 3}}

    it 'make themseleves immutable' do
      expect(hash.symbolize_keys!).to be(hash)
    end

    it 'make value of themseleves mutable' do
      expect(hash.symbolize_keys!).to eq(hash)
    end

    it 'each of type of keys be symbol' do
      hash.symbolize_keys!.keys.each do |key|
        expect(key).to be_instance_of Symbol
      end
    end
  end

end
