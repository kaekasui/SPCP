class EventEquipment < ActiveRecord::Base
  attr_accessible :equipment_type_id, :event_type_id
  belongs_to :equipment_type
  belongs_to :event_type
end
