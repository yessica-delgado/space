class AddDatesToBooking < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :dates, :datetime
  end
end
