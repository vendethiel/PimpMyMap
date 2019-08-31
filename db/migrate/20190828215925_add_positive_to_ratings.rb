class AddPositiveToRatings < ActiveRecord::Migration[6.0]
  def change
    add_column :ratings, :positive, :bool
  end
end
