class AddEquipmentableIdToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :equipmentable_id, :integer
  end
end
