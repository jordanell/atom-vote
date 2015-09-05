require 'rails_helper'

describe OptionSerializer do
  before(:each) do
    @option = FactoryGirl.create(:option)
  end

  subject { OptionSerializer.new(@option) }

  # Attributes
  it { should have_attributes(id: @option.id) }
  it { should have_attributes(text: @option.text) }
  it { should have_attributes(votes_count: @option.votes_count) }
  it { should have_attributes(updated_at: @option.updated_at) }
  it { should have_attributes(created_at: @option.created_at) }

  # Associations
  it { should have_attributes(poll_id: @option.poll_id) }
end
