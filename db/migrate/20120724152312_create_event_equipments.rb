class CreateEventEquipments < ActiveRecord::Migration
  def change
    create_table :event_equipments do |t|
      t.integer :event_type_id
      t.integer :equipment_type_id

      t.timestamps
    end
  end
end
