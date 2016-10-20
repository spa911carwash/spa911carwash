class SpaEmailsController < ApplicationController

	def contact_us
		message = permited_params
		if message[:name].present? && message[:email].present? && message[:message].present?
			SpaMailer.contact_us(message).deliver_now
			redirect_to contact_us_path, :flash => { :success => "Thanks! We recevied your feedback" } 
		else
			redirect_to contact_us_path, :flash => { :error => "Please fill all the details to contact us" } 
		end
	end


	private

	def permited_params
		params.permit(:name,:email,:message)
	end
end
