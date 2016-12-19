class PackageEnquiry < ActiveRecord::Base

	ECO = "Eco Spa"
	MODERATE = "Moderate Spa"
	LUXURY = "Luxury Spa"
	ROYAL = "Royal Spa"
	PACKAGES = [ECO,MODERATE,LUXURY,ROYAL]

	attr_accessor :send_mail
	
	validates :package_type,:name,:email,:phone_number, presence: true
	validates :email, format: { with: VALID_EMAIL_REGEX }
	validates :phone_number, :numericality => {:only_integer => true}
	validates_length_of :phone_number,:minimum => 10, :maximum => 10

	after_save :send_enquiry

	private

	def send_enquiry
		if self.send_mail.present? && self.send_mail == true
			SpaMailer.package_enquiry(self.id).deliver_now
		end
	end
	
end
