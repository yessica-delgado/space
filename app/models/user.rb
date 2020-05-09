class User < ApplicationRecord
include Gravtastic
gravtastic

  has_many :venues
  has_many :bookings
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


end
