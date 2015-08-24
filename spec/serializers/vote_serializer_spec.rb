require 'rails_helper'

describe VoteSerializer do
  before(:each) do
    @vote = FactoryGirl.create(:vote)
  end

  subject { VoteSerializer.new(@vote).object }

  # Attributes
  it { should have_attributes(voter_uuid: @vote.voter_uuid) }
  it { should have_attributes(updated_at: @vote.updated_at) }
  it { should have_attributes(created_at: @vote.created_at) }

  # Associations
  it { should have_attributes(poll_id: @vote.poll_id) }
  it { should have_attributes(option_id: @vote.option_id) }
end
