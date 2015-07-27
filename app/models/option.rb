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

class Option < ActiveRecord::Base
  belongs_to :poll

  has_many :votes

  validates :text, presence: true
end
