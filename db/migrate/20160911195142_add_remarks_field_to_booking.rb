class AddRemarksFieldToBooking < ActiveRecord::Migration
  def change
  	add_column :bookings, :remarks, :text
  end
end
