class AddPollIdToOptions < ActiveRecord::Migration
  def change
    add_column :options, :poll_id, :integer
  end
end
