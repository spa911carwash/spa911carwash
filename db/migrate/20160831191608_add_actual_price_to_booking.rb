class AddActualPriceToBooking < ActiveRecord::Migration
  def change
  	add_column :bookings, :actual_price, :integer
  end
end
