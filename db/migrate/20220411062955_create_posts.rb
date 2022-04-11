class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :player_id
      t.string :title
      t.text :about
      t.timestamps
    end
  end
end
