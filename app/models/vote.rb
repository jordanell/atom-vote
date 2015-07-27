# == Schema Information
#
# Table name: votes
#
#  id         :integer          not null, primary key
#  option_id  :integer
#  voter_uuid :string
#  created_at :datetime
#  updated_at :datetime
#  poll_id    :integer
#

class Vote < ActiveRecord::Base
  belongs_to :option
  belongs_to :poll

  validates :voter_uuid, presence: true
  validates :poll_id, presence: true
  validates :option_id, presence: true
  validates_uniqueness_of :voter_uuid, scope: :poll_id
end
