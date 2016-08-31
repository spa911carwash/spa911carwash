class Booking < ActiveRecord::Base

	attr_accessor :send_mail

	FIRST_HALF = "9am to 12pm"
	SECOND_HALF = "12pm to 15pm"
	THIRD_HALF = "15pm to 18pm"

	validates :name, :contact_number,:email,:address,:date, presence: true
	validates :email, format: { with: VALID_EMAIL_REGEX }
	validates :contact_number, :numericality => {:only_integer => true}
	validates_length_of :contact_number,:minimum => 10, :maximum => 10

	belongs_to :service
	after_save :send_confirmation


	def selected_time
		selected_time = []		
		selected_time << FIRST_HALF if self.first_half?	
		selected_time << SECOND_HALF if self.second_half?	
		selected_time << THIRD_HALF if self.third_half?
		if selected_time.blank?
			selected_time << "9am to 18pm"
		end

		selected_time.join(' or ')
	end

	def send_confirmation
		if self.send_mail.present? && self.send_mail == true
			SpaMailer.confirmation(self.id).deliver_now
		end
	end

	def price
		self.service.present? ? self.service.price : 0
	end
end
