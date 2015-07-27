class RenameChoicesToOptions < ActiveRecord::Migration
  def change
    rename_table :choices, :options
  end
end
