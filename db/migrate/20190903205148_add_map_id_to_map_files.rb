class AddMapIdToMapFiles < ActiveRecord::Migration[6.0]
  def change
    #add_belongs_to :map_files, :map, null: false, foreign_key: true

    # Cannot add non-null columns in SQLite except on schema creation
    add_column :map_files, :map_id, :integer
    change_column :map_files, :map_id, :integer, null: false
  end
end
