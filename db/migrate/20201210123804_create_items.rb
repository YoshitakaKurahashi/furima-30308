class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string      :item_name,         null: false
      t.text        :item_explanation,  null: false
      t.integer     :item_category_id,  null: false
      t.integer     :item_status_id,    null: false
      t.integer     :delivery_fee_id,   null: false
      t.integer     :prefecture_id,     null: false
      t.integer     :delivery_day_id,   null: false
      t.integer     :price,             null: false
      t.timestamps
      t.integer     :user_id,           null: false
    end
  end
end
