class AddItemIdToOrderItems < ActiveRecord::Migration[6.1]
  def change
    add_column :order_items, :item_id, :integer
    add_column :order_items, :order_id, :integer
    change_column :order_items, :item_id, :integer, null: false
    change_column :order_items, :order_id, :integer, null: false
  end
end
