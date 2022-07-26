class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      # 追加
      t.integer :price,               null: false, default: ""
      t.integer :amount,              null: false, default: ""
      t.integer :manufacture_status,  null: false, default: "0"

      t.timestamps
    end
  end
end
