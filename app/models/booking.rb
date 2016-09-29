class Booking < ActiveRecord::Base

	attr_accessor :send_mail

	FIRST_HALF = "9am to 12pm"
	SECOND_HALF = "12pm to 15pm"
	THIRD_HALF = "15pm to 18pm"
	MAXIMUM_TEAMS = Team.all.count
	MAXIMUM_ALLOWED_BOOKINGS = MAXIMUM_TEAMS * 3

	validates :name, :contact_number,:email,:address,:date, presence: true
	validates :email, format: { with: VALID_EMAIL_REGEX }
	validates :contact_number, :numericality => {:only_integer => true}
	validates_length_of :contact_number,:minimum => 10, :maximum => 10
	validate :any_present?


	belongs_to :service
	belongs_to :team
	#before_save :default_time
	after_save :send_confirmation

	scope :today_bookings, -> (date) { where(:date => date) }


	def self.get_empty_slots(date)
		maximum_teams = Team.all.count
		total_bookings = Booking.today_bookings(date)
		#raise total_bookings.inspect
		first_half_bookings = total_bookings.where(first_half: true).count
		second_half_bookings = total_bookings.where(second_half: true).count
		third_half_bookings = total_bookings.where(third_half: true).count
		allowed_timeslots = {
		  first_half: (first_half_bookings < maximum_teams ) ? true : false,
		  second_half: (second_half_bookings < maximum_teams ) ? true : false,
		  third_half: (third_half_bookings < maximum_teams ) ? true : false
		}

		allowed_timeslots
	end

	def remaining_bookings
		MAXIMUM_ALLOWED_BOOKINGS - self.today_bookings.count
	end

	def occupied_teams
		self.today_bookings
	end

	def service_name
		self.service.present? ? self.service.name.split("-").join(" ").humanize : ''
	end
	

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

	private

	def default_time
		self.third_half = true unless self.first_half && self.second_half && self.third_half
	end

	def any_present?
	  if %w(first_half second_half third_half).all?{|attr| self[attr].blank?}
	    errors.add :base, "Please select atleast any one time slot"
	  end
	end
end
