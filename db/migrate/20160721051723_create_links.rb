class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.string :slug
      t.string :destination
      t.integer :click_count
      t.datetime :last_click_at

      t.timestamps
    end
    add_index :links, :slug, unique: true
  end
end
