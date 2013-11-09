require 'spec_helper'

describe 'A frame consists of' do
  let(:base_frame) {File.open(File.join(ROOT, 'spec/fixtures/base_frame')).read}
  context 'a command' do

    it 'should be instance of String' do
      p base_frame
    end

    it 'should be capital' do
    end
  end
end
