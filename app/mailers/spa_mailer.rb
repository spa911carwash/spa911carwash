class SpaMailer < ApplicationMailer

	def contact_us(customer = {})
		mail(to: "spa911forcar@gmail.com" , subject: customer[:subject]) if customer[:email].present?
	end

	def confirmation(order_id)
		@order = Booking.find(order_id)
		mail(to: @order.email , subject: "Booking Received")
	end

end
