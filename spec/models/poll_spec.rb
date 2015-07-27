# == Schema Information
#
# Table name: polls
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  uuid       :string           not null
#  title      :string
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
  it { should respond_to(:title) }

  # Associations
  it { should respond_to(:options) }

  # Validations
  it 'should have a uuid' do
    @poll.uuid = nil

    @poll.should_not be_valid
  end

  it 'should have at least two valid options' do
    @poll.options = []

    @poll.should_not be_valid
  end

  # Public methods
  describe '#voter_uuids' do
    it 'should return the uuids of all votes' do
      @option = FactoryGirl.create(:option, poll: @poll)
      @vote = FactoryGirl.create(:vote, option: @option, poll: @poll)

      @poll.reload.voter_uuids.should eq([@vote.voter_uuid])
    end
  end
end
