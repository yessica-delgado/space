class ChangeDatetimeToDate < ActiveRecord::Migration[6.0]
  def change
    change_column :bookings, :dates, :datetime, using: 'dates::date'
  end
end
