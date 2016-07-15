class SpaMailer < ApplicationMailer

	def contact_us(customer = {})
		
		if customer[:email].present?
			mail(to: "spa911forcar@gmail.com" , subject: customer[:subject]) 
		end
	end

	def confirmation(order_id)
		@order = Booking.find(order_id)
		mail(to: @order.email , subject: "Booking Received")
	end

end
