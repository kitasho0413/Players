class AddIsDeletedToPlayers < ActiveRecord::Migration[6.1]
  def change
    add_column :players, :is_deleted, :boolean, default: false
  end
end
