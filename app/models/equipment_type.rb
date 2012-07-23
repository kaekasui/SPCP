class EquipmentType < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :equipment
end
