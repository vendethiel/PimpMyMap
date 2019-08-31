class CreateScreenshots < ActiveRecord::Migration[6.0]
  def change
    create_table :screenshots do |t|
      t.string :name
      t.string :description
      t.string :image

      t.timestamps
    end
  end
end
