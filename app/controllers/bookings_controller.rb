class BookingsController < ApplicationController
  before_filter :get_service

  def index
    redirect_to services_path
  end

  def new
  	@order = @service.bookings.build
  end

  def show
    @booking = Booking.includes(:service).find(params[:id])
  end

  def create
		@order = @service.bookings.build(permited_params)
  	if @order.save
      redirect_to service_booking_path(@service.name,@order.id)
  	else
  		render :new
  	end
  end


  private

  def permited_params
  	params.require(:booking).permit(:name,:contact_number,:email,:address,:landmark,:date,:first_half,:second_half,:third_half)
  end

  def get_service
    @service = Service.find_by_name(params[:service_id])
    if @service.present?
      car = Service.where(name: @service.name.split('-').last).first
      @car_list = car.car_list
    else
      redirect_to services_path, :flash => { :error => "Sorry! unable to find service" }
    end
     
  end
end
