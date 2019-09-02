class AddCommentToRatings < ActiveRecord::Migration[6.0]
  def change
    add_column :ratings, :comment, :string
  end
end
