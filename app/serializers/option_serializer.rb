class OptionSerializer < ActiveModel::Serializer
  root false

  attributes :id, :poll_id, :text, :votes_count, :percentage_of_votes, :updated_at, :created_at
end
