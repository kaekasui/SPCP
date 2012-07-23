class AddConditionAndAssistanceAndDescriptionAndManufacturerAndAvailableToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :condition, :integer
    add_column :equipment, :assistance, :boolean
    add_column :equipment, :description, :text
    add_column :equipment, :manufacturer, :string
    add_column :equipment, :available, :boolean
  end
end
