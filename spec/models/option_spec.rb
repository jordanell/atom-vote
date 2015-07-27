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
end
