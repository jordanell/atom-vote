require 'rails_helper'

RSpec.describe Question, type: :model do
  before do
    @question = FactoryGirl.create(:question)
  end

  subject{ @question }

  # Attributes
  it { should respond_to(:id) }
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }
  it { should respond_to(:title) }
  it { should respond_to(:poll_id) }

  # Associations
  it { should respond_to(:poll) }
  it { should respond_to(:choices) }
end