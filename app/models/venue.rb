class Venue < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_one_attached :photo

#def self.show(id)
 # if show
  #  where(["name LIKE ?","%#{show}%"])
  #else
  #  all
  #end
#end


end
