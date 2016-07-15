class RevertIntegerType < ActiveRecord::Migration
  def change
  	change_column :bookings, :contact_number, :integer, limit: 8
  end
end
