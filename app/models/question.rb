# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  title      :string
#  poll_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Question < ActiveRecord::Base
  belongs_to :poll

  has_many :choices

  validates :title, presence: true
  validate :validate_choices

  validates_associated :choices

  accepts_nested_attributes_for :choices

  private

  def validate_choices
    valid_choices = 0
    choices.each do |choice|
      valid_choices += 1 if choice.title.length > 0
    end

    errors.add(:choices, 'not enough') if valid_choices < 2
  end
end
