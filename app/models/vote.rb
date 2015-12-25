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
  belongs_to :option, counter_cache: true, touch: true
  belongs_to :poll, counter_cache: true, touch: true

  validates :voter_uuid, presence: true
  validates :poll_id, presence: true
  validates :option_id, presence: { message: 'You must select an option' }

  validates_uniqueness_of :voter_uuid, scope: :poll_id, message: 'You have already voted on this poll'
end
