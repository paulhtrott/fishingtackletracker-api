class AddTackleTypeIdToTackles < ActiveRecord::Migration[5.1]
  def change
    add_column :tackles, :tackle_type_id, :integer, index: true
  end
end
