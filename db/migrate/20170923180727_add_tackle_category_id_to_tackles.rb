class AddTackleCategoryIdToTackles < ActiveRecord::Migration[5.1]
  def change
    add_column :tackles, :tackle_category_id, :integer, index: true
  end
end
