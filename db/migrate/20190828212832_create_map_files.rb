class CreateMapFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :map_files do |t|
      t.string :name
      t.string :description
      t.string :file

      t.timestamps
    end
  end
end
