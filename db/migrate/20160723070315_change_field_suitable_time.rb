class ChangeFieldSuitableTime < ActiveRecord::Migration
  def change
  	remove_column :bookings, :time
  	add_column :bookings, :first_half, :boolean
  	add_column :bookings, :second_half, :boolean
  	add_column :bookings, :third_half, :boolean
  end
end
