class Venue < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :bookings
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_venue,
    against: [ :name ],
    using: {
      tsearch: { prefix: true }
    }

#def self.show(id)
 # if show
  #  where(["name LIKE ?","%#{show}%"])
  #else
  #  all
  #end
#end


end
