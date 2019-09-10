class AddVersionRemoveLatest < ActiveRecord::Migration[6.0]
  def change
    add_column :maps, :version, :text
    remove_column :maps, :latest, :date
  end
end
