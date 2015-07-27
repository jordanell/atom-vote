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

class Choice < ActiveRecord::Base
  belongs_to :question
  has_many :votes

  delegate :poll, to: :question
end
