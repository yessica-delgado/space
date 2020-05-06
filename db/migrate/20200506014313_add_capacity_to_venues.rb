class AddCapacityToVenues < ActiveRecord::Migration[6.0]
  def change
    add_column :venues, :capacity, :integer
  end
end
