class BookingsController < ApplicationController
  before_filter :get_service

  def index
    redirect_to services_path
  end

  def new
    date = Date.today
  	@order = @service.bookings.build
    @order.team_id = Team.first.id
    @time = Time.now.hour
    @allowed_timeslots = Booking.get_empty_slots(date)
  end

  def show
    @booking = Booking.includes(:service).find(params[:id])
  end

  def create
    
		@order = @service.bookings.build(permited_params)
    date = @order.date.present? ? @order.date : Date.today
    @time = Time.now.hour if Date.today == date
    @allowed_timeslots = Booking.get_empty_slots(date)
    @order.send_mail = true
  	if @order.save
      redirect_to service_booking_path(@service.name,@order.id)
  	else
  		render :new
  	end
  end

  def check_for_empty_slots
    date = params[:date].to_date
    @time = Time.now.hour if Date.today == date
    @allowed_timeslots = Booking.get_empty_slots(date)
  end


  private

  def permited_params
  	params.require(:booking).permit(:name,:contact_number,:email,:address,:landmark,:date,:first_half,:second_half,:third_half, :team_id)
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
