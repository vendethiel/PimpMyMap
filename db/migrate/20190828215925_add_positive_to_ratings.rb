class AddPositiveToRatings < ActiveRecord::Migration[6.0]
  def change
    add_column :ratings, :positive, :boolean
  end
end
