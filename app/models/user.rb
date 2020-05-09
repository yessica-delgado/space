class User < ApplicationRecord
include Gravtastic
gravtastic

  has_many :venues
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


end
