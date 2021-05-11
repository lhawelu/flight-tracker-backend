class User < ApplicationRecord
  has_secure_password

  has_many :bookings
  has_many :flights, through: :bookings

  validates :username, uniqueness: true
  validates :password, length: { minimum: 6 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

end
