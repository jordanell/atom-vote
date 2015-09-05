class VoteSerializer < ActiveModel::Serializer
  root false

  attributes :voter_uuid, :poll_id, :option_id, :updated_at, :created_at
end
