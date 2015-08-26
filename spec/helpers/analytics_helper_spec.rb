require 'rails_helper'

describe AnalyticsHelper do
  describe '#send_event' do
    it 'should return true with category and action' do
      helper.send_event('Object', 'Action').should eq(true)
    end

    it 'should return true with label and value' do
      helper.send_event('Object', 'Action', 'me', 1).should eq(true)
    end
  end
end
