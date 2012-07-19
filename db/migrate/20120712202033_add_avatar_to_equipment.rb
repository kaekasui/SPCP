class AddAvatarToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :avatar, :string
  end
end
