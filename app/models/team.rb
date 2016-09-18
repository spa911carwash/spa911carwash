class Team < ActiveRecord::Base

	has_many :bookings
	has_many :employees
end
