class ChangeVenuesIdToVenueIdInReviews < ActiveRecord::Migration[6.0]
  def change
    rename_column :reviews, :venues_id, :venue_id
  end
end
