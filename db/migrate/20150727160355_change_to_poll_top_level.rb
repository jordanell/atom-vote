class ChangeToPollTopLevel < ActiveRecord::Migration
  def change
    add_column :polls, :title, :string
    add_column :votes, :poll_id, :integer

    rename_column :options, :title, :text
    rename_column :votes, :choice_id, :option_id

    remove_column :options, :question_id
  end
end
