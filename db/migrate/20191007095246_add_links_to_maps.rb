class AddLinksToMaps < ActiveRecord::Migration[6.0]
  def change
    add_column :maps, :links, :jsonb
  end
end
