require 'spec_helper'
class ConvertorTest
  include Rbmq::Utils::Convertor
end

describe "Convertor" do
  let(:convertor) { ConvertorTest.new }
  it 'convert str with colon to hash' do
    expect(convertor.to_hash_of('a:1')).to eq({a:'1'})
    expect(convertor.to_hash_of(['a:1', 'b:2'])).to eq({a:'1',b: '2'})
  end

  it 'convert hash to array with colon' do
    expect(convertor.to_ary_of({a:1})).to eq(["a:1"])
    expect(convertor.to_ary_of({a:1, b:2})).to eq(["a:1", "b:2"])
  end
end
