class PollSerializer < ActiveModel::Serializer
  root false

  attributes :uuid, :question, :votes_count, :updated_at, :created_at

  has_many :options
end
