class AddMapToScreenshots < ActiveRecord::Migration[6.0]
  def change
    #add_belongs_to :screenshots, :map, null: false, foreign_key: true

    # Cannot add non-null columns in SQLite except on schema creation
    add_column :screenshots, :map_id, :integer
    change_column :screenshots, :map_id, :integer, null: false
  end
end
