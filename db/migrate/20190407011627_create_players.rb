class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players, id: false do |t|
      t.string :name
      t.integer :strength
      t.integer :speed
      t.integer :agility
      t.string :unique_id, null: false
      t.boolean :is_starter?, default: false
      t.references :team, foreign_key: true


      t.timestamps
    end

    add_index :players, :unique_id, unique: true
  end
end
