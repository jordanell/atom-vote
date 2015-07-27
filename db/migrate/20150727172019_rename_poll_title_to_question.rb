class RenamePollTitleToQuestion < ActiveRecord::Migration
  def change
    rename_column :polls, :title, :question
  end
end
