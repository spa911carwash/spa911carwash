class PackageEnquiry < ActiveRecord::Base

	ECO = "Eco Spa"
	MODERATE = "Moderate Spa"
	LUXURY = "Luxury Spa"
	ROYAL = "Royal Spa"
	PACKAGES = [ECO,MODERATE,LUXURY,ROYAL]

	validates :package_type,:name,:email,:phone_number, presence: true
	validates :email, format: { with: VALID_EMAIL_REGEX }
	validates :phone_number, :numericality => {:only_integer => true}
	validates_length_of :phone_number,:minimum => 10, :maximum => 10
	
end
