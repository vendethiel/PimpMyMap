class AddImageToMaps < ActiveRecord::Migration[6.0]
  def change
    add_column :maps, :image, :string
  end
end
