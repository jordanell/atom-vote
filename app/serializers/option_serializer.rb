class OptionSerializer < ActiveModel::Serializer
  attributes :id, :poll_id, :text, :votes_count, :updated_at, :created_at
end
