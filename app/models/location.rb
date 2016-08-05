class Location < ActiveRecord::Base
  has_one :admin

  validates :restaurant_name, presence: true
  validates :address, presence: true
  validates :postal_code, presence: true, format: { :with => /(^\d{5}(-\d{4})?$)|(^[ABCEGHJKLMNPRSTVXY]{1}\d{1}[A-Z]{1} *\d{1}[A-Z]{1}\d{1}$)/ }
  validates :city, presence: true
  validates :state, presence: true
  validates :main_phone, :presence => true, phone: true
  validates :website
  validates :position, presence: true
end
