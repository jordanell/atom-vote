class RemovePollIdFromVotes < ActiveRecord::Migration
  def change
    remove_column :votes, :poll_id
  end
end
