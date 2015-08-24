class PollSerializer < ActiveModel::Serializer
  attributes :uuid, :question, :votes_count, :updated_at, :created_at

  has_many :options
end
