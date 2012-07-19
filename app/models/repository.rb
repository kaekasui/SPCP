class Repository < ActiveRecord::Base
  attr_accessible :address, :city, :country, :email, :name, :phone, :postal, :website
  has_many    :equipment, :as => :equipmentable
end
