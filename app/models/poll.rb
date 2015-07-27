# == Schema Information
#
# Table name: polls
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class Poll < ActiveRecord::Base
  has_many :questions

  validates :uuid, presence: true
  validate :validate_questions

  validates_associated :questions

  accepts_nested_attributes_for :questions

  before_validation(on: :create) do
    self.uuid = SecureRandom.urlsafe_base64
  end

  def voter_uuids
    uuids = []
    questions.each do |question|
      question.choices.each do |choice|
        uuids << choice.votes.map(&:voter_uuid)
      end
    end

    uuids.flatten.uniq
  end

  private

  def validate_questions
    errors.add(:questions, 'not enough') if questions.size < 1
  end
end
