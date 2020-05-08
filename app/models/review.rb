class Review < ApplicationRecord
  belongs_to :venues
  validates :content, presence: true

end
