class ChangeIntegerType < ActiveRecord::Migration
  def change
  	change_column :bookings, :contact_number, :bigint
  end
end
