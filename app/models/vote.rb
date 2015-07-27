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

class Vote < ActiveRecord::Base
  belongs_to :choice

  validates :voter_uuid, presence: true
  validates :choice_id, presence: true

  validate :unique_vote, on: :create

  delegate :question, :poll, to: :choice

  private

   def unique_vote
    errors.add(:voter_uuid, 'has already voted') if poll.voter_uuids.include? voter_uuid
  end
end
