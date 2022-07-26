class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      # 追加
      t.string :name,        null: false, default: ""
      t.text :introduction,  null: false, default: ""
      t.integer :praice,     null: false, default: ""
      t.boolean :is_active,  null: false, default: "true"

      t.timestamps
    end
  end
end
