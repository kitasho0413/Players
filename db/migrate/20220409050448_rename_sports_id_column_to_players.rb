class RenameSportsIdColumnToPlayers < ActiveRecord::Migration[6.1]
  def change
    rename_column :players, :sports_id, :sport_id
  end
end
