class AddEquipmentableTypeToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :equipmentable_type, :string
  end
end
