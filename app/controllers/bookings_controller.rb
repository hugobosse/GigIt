class BookingsController < ApplicationController

  before_action :set_booking, only: [:show, :destroy]
  def index
    @bookings = current_user.bookings
  end

  def show
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.bar = Bar.find(params[:bar_id])
    #@booking.user = User.find(params[:user_id])
    if @booking.save
      redirect_to booking_path(@booking)
    # else  <------------------------------------ à voir sur quoi on render
      #to do render
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:booking_date, :user_id, :bar_id)
  end
end
