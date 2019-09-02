class AddUniquenessToRatings < ActiveRecord::Migration[6.0]
  def change
    add_index :ratings, [:user_id, :map_id], unique: true
  end
end
