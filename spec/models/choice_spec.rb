require 'rails_helper'

RSpec.describe Choice, type: :model do
  before do
    @choice = FactoryGirl.create(:choice)
  end

  subject{ @choice }

  # Attributes
  it { should respond_to(:id) }
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }
  it { should respond_to(:title) }
  it { should respond_to(:question_id) }

  # Associations
  it { should respond_to(:question) }

  # Delegates
  it { should respond_to(:poll) }
end