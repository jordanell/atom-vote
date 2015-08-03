# == Schema Information
#
# Table name: options
#
#  id         :integer          not null, primary key
#  text       :string
#  created_at :datetime
#  updated_at :datetime
#  poll_id    :integer
#

require 'rails_helper'

RSpec.describe Option, type: :model do
  before do
    @option = FactoryGirl.create(:option)
  end

  subject{ @option }

  # Attributes
  it { should respond_to(:id) }
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }
  it { should respond_to(:text) }
  it { should respond_to(:poll_id) }

  # Associations
  it { should respond_to(:poll) }
  it { should respond_to(:votes) }

  # Public methods
  describe '#percentage_of_votes' do
    it 'should return the correct non zero percentage' do
      @vote = FactoryGirl.create(:vote, option: @option, poll: @option.poll)

      @option.reload.percentage_of_votes.should eq(100)
    end

    it 'should return zero' do
      @option.reload.percentage_of_votes.should eq(0)
    end
  end
end
