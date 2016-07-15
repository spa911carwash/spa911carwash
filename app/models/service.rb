class Service < ActiveRecord::Base

	has_many :bookings
	has_many :car_list
end
