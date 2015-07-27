# == Schema Information
#
# Table name: polls
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Poll, type: :model do
  before do
    @poll = FactoryGirl.create(:poll)
  end

  subject{ @poll }

  # Attributes
  it { should respond_to(:id) }
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }
  it { should respond_to(:uuid) }

  # Associations
  it { should respond_to(:questions) }

  # Validations
  it 'should have a uuid' do
    @poll.uuid = nil

    @poll.should_not be_valid
  end

  it 'should have at least one question' do
    @poll.questions = []

    @poll.should_not be_valid
  end

  # Public methods
  describe '#voter_uuids' do
    it 'should return the uuids of all votes' do
      @question = FactoryGirl.create(:question)
      @poll.questions << @question
      @poll.save
      @choice = FactoryGirl.create(:choice, question: @question)
      @vote = FactoryGirl.create(:vote, choice: @choice)

      @poll.reload.voter_uuids.should eq([@vote.voter_uuid])
    end
  end
end
