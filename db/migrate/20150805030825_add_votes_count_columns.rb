class AddVotesCountColumns < ActiveRecord::Migration
  def change
    add_column :polls, :votes_count, :integer, default: 0
    add_column :options, :votes_count, :integer, default: 0
  end
end
