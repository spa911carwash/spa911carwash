class Booking < ActiveRecord::Base

	validates :name, :contact_number,:email,:address,:date, presence: true
	validates :email, format: { with: VALID_EMAIL_REGEX }

	belongs_to :service
end
