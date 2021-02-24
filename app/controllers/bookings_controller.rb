class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user_id: current_user.id)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @automobile = Automobile.find(params[:automobile_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @automobile = Automobile.find(params[:automobile_id])
    @booking.user = current_user
    @booking.automobile = @automobile
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:starting_date, :finish_date)
  end
end
