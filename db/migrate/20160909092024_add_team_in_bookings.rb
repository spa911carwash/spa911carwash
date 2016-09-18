class AddTeamInBookings < ActiveRecord::Migration
  def change
  	add_column :bookings, :team_id, :integer
  end
end
