class CreateMaps < ActiveRecord::Migration[6.0]
  def change
    create_table :maps do |t|
      t.string :name
      t.string :description
      t.references :user, null: false, foreign_key: true
      t.string :size
      t.date :latest
      t.integer :mode
      t.integer :category

      t.timestamps
    end
    add_index :maps, :name, unique: true
  end
end
