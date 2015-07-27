class AddUuidToPolls < ActiveRecord::Migration
  def change
    add_column :polls, :uuid, :string, null: false
  end
end
