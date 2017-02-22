class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @bar = Bar.find(params[:bar_id])
    @booking.bar = @bar
    if @booking.save
      redirect_to bookings_path, notice: "Your Booking is well created!"
    else
      render "bars/show"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:booking_date, :user_id, :bar_id)
  end
end
