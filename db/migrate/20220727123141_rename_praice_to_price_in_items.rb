class RenamePraiceToPriceInItems < ActiveRecord::Migration[6.1]
  def change
    rename_column :items, :praice, :price
  end
end
