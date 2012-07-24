class EquipmentType < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :equipment
  has_many :event_equipment
  has_many :event_types, :through => :event_equipment
end
