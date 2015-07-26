class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :poll_id
      t.integer :choice_id
      t.string :voter_uuid

      t.timestamps
    end
  end
end
