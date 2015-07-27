# == Schema Information
#
# Table name: choices
#
#  id          :integer          not null, primary key
#  title       :string
#  question_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

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
  it { should respond_to(:votes) }

  # Delegates
  it { should respond_to(:poll) }
end
