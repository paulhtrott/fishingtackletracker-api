class CreateTackles < ActiveRecord::Migration[5.1]
  def change
    create_table :tackles do |t|
      t.integer  :user_id
      t.string   :name
      t.text     :description
      t.decimal  :size,                   precision: 12, scale: 2
      t.integer  :quantity
      t.string   :color
      t.string   :model_number
      t.string   :shape
      t.decimal  :length
      t.decimal  :weight
      t.string   :brand
      t.integer  :quantity_wanted
      t.decimal  :price,                   precision: 12, scale: 2

      t.timestamps
    end
    add_index :tackles, :user_id
  end
end
