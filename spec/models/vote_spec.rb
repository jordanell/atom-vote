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
end