require 'rails_helper'

describe AnalyticsHelper do
  before(:each) do
    unless GOOGLE_ANALYTICS
      GOOGLE_ANALYTICS = 'fake-id'
    end
  end

  describe '#send_event' do
    it 'should return true with category and action' do
      helper.send_event('Object', 'Action').should eq(true)
    end

    it 'should return true with label and value' do
      helper.send_event('Object', 'Action', 'me', 1).should eq(true)
    end
  end
end
