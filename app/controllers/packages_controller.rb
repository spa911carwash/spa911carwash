class PackagesController < ApplicationController

	def index
		@package = PackageEnquiry.new 
	end

	def show
		@package = PackageEnquiry.find(params[:id])
	end

	def create
		@package = PackageEnquiry.new(permited_params)
  	if @package.save
      redirect_to package_path(@package)
  	else
  		render :index
  	end
	end


	private
	def permited_params
  	params.require(:package_enquiry).permit(:package_type,:name,:email,:phone_number)
  end
end
