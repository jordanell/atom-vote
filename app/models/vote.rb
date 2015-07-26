# == Schema Information
#
# Table name: votes
#
#  id         :integer          not null, primary key
#  poll_id    :integer
#  choice_id  :integer
#  voter_uuid :string
#  created_at :datetime
#  updated_at :datetime
#

class Vote < ActiveRecord::Base
  belongs_to :poll
  belongs_to :choice

  validates :voter_uuid, presence: true
  validates_uniqueness_of :voter_uuid, :scope => :poll_id
end
