class CreateTackleTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :tackle_types do |t|
      t.string :name, index: true, unique: true
      t.integer :tackle_category_id, index: true

      t.timestamps
    end
  end
end
