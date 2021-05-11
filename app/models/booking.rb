class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flight

  validates :user_id, :uniqueness => { :scope => :flight_id, :message => "has already booked this flight." }
  validates :seat, :uniqueness => { :scope => :flight_id, :message => "has already been taken on this flight." }

end
