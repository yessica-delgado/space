class AddPriceToVenues < ActiveRecord::Migration[6.0]
  def change
    add_column :venues, :price, :integer

  end
end
