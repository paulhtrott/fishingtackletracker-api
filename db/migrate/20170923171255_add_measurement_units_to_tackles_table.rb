class AddMeasurementUnitsToTacklesTable < ActiveRecord::Migration[5.1]
  def change
    add_column :tackles, :length_unit, :string
    add_column :tackles, :weight_unit, :string
  end
end
