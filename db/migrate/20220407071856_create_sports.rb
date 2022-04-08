class CreateSports < ActiveRecord::Migration[6.1]
  def change
    create_table :sports do |t|
      t.integer :player_id
      t.string :sport_name
      t.timestamps
    end
  end
end
