require 'rails_helper'

describe PollSerializer do
  before(:each) do
    @poll = FactoryGirl.create(:poll)
  end

  subject { PollSerializer.new(@poll).object }

  # Attributes
  it { should have_attributes(uuid: @poll.uuid) }
  it { should have_attributes(question: @poll.question) }
  it { should have_attributes(votes_count: @poll.votes_count) }
  it { should have_attributes(updated_at: @poll.updated_at) }
  it { should have_attributes(created_at: @poll.created_at) }

  # Associations
  it { should have_attributes(options: @poll.options) }
end
