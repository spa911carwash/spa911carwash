class BookingsController < ApplicationController
  before_filter :get_service

  def index
    redirect_to services_path
  end

  def new
  	@order = @service.bookings.build
  end

  def show

  end

  def create
		@order = @service.bookings.build(permited_params)
  	if @order.save
      SpaMailer.confirmation(@order.id).deliver_now
      redirect_to service_booking_path(@service.name,@order.id)
  	else
  		render :new
  	end
  end


  private

  def permited_params
  	params.require(:booking).permit(:name,:contact_number,:email,:address,:landmark,:date)
  end

  def get_service
    @service = Service.find_by_name(params[:service_id])
    redirect_to services_path, :flash => { :error => "Sorry! unable to find service" } unless @service.present?
  end
end
