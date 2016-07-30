class SpaMailer < ApplicationMailer

	def contact_us(customer = {})
		
		if customer[:email].present?
			@message = customer[:message]
			@name = customer[:name]
			mail(to: "spa911carwash@gmail.com" , subject: customer[:subject]) 
		end
	end

	def confirmation(order_id)
		@booking = Booking.find(order_id)
		mail(to: @booking.email,bcc: "spa911carwash@gmail.com" , subject: "Booking Received")
	end

end
