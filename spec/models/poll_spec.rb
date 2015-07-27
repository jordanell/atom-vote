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

  # Associations
  it { should respond_to(:questions) }
end