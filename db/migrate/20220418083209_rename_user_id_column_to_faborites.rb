class RenameUserIdColumnToFaborites < ActiveRecord::Migration[6.1]
  def change
    rename_column :favorites, :user_id, :player_id
  end
end
