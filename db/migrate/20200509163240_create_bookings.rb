class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.integer :price
      t.references :venue
      t.references :user

      t.timestamps
    end
  end
end
