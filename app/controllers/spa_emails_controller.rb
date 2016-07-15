class SpaEmailsController < ApplicationController

	def contact_us
		message = permited_params
		SpaMailer.contact_us(message).deliver_now
		redirect_to contact_us_path, :flash => { :success => "Thanks! We recevied your feedback" } 
	end


	private

	def permited_params
		params.permit(:name,:email,:subject,:message)
	end
end
