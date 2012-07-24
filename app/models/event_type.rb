class EventType < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :events
  has_many :event_equipment
  has_many :equipment_types, :through => :event_equipment
end
