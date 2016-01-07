# == Schema Information
#
# Table name: polls
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  uuid       :string           not null
#  question   :string
#

class Poll < ActiveRecord::Base
  has_many :options, -> { order 'id ASC' }
  has_many :votes

  validates :uuid, presence: true
  validates :question, presence: { message: 'You must enter a question.'}
  validates :options, length: { minimum: 2, message: 'You must have at least two options.' }

  validates_associated :options

  accepts_nested_attributes_for :options

  before_validation(on: :create) do
    self.uuid = SecureRandom.urlsafe_base64
  end

  before_validation do
    options.each do |option|
      if option.text.length < 1
        options.delete(option)
      end
    end
  end

  def voter_uuids
    uuids = votes.map(&:voter_uuid)
    uuids.flatten.uniq
  end

  def pad_options(count = 4)
    (0...count).each do |index|
      options << Option.new
    end
  end
end
