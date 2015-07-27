# == Schema Information
#
# Table name: votes
#
#  id         :integer          not null, primary key
#  choice_id  :integer
#  voter_uuid :string
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Vote, type: :model do
  before do
    @vote = FactoryGirl.create(:vote)
  end

  subject{ @vote }

  # Attributes
  it { should respond_to(:id) }
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }
  it { should respond_to(:voter_uuid) }
  it { should respond_to(:choice_id) }

  # Associations
  it { should respond_to(:choice) }

  # Delegates
  it { should respond_to(:poll) }
  it { should respond_to(:question) }

  # Validations
  it 'should have vote_uuid' do
    @vote.voter_uuid = nil

    @vote.should_not be_valid
  end

  it 'should have a choice' do
    @vote.choice_id = nil

    @vote.should_not be_valid
  end

  it 'should be unique to the poll' do
    @vote2 = @vote.dup

    @vote2.should_not be_valid
  end
end
