class AddIndicies < ActiveRecord::Migration
  def change
    add_index :polls, :uuid, unique: true

    add_index :options, :poll_id

    add_index :votes, :poll_id
    add_index :votes, :option_id
    add_index :votes, [:voter_uuid, :poll_id], unique: true
  end
end
