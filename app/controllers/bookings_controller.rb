class BookingsController < ApplicationController
    def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.bar = Bar.find(params[:bar_id])
    if @booking.save
      redirect_to booking_path(@booking)
    # else  <------------------------------------ à voir sur quoi on render
      #to do render
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:booking_date, :user_id, :bar_id)
  end
end
