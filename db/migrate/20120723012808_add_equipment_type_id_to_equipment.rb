class AddEquipmentTypeIdToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :equipment_type_id, :integer
  end
end
