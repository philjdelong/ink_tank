class Shop < ApplicationRecord
  has_many :artists

  validates_presence_of :name
  validates_presence_of :street_address
  validates_presence_of :city
  validates_presence_of :phone_number
  validates_presence_of :zip

end
