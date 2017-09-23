class CreateTackleCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :tackle_categories do |t|
      t.string :name, index: true, unique: true

      t.timestamps
    end
  end
end
