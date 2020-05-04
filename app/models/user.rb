class User < ApplicationRecord
  has_many :venues
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


end
