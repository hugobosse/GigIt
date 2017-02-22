class BookingsController < ApplicationController

  before_action :set_booking, only: [:show, :destroy]
  def index
    @bookings = current_user.bookings
  end

  def show
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

  def destroy
    @booking.destroy
    redirect_to bookings_path

  def add_review
    @booking = Booking.find(params[:id])

  end

  def update_review
    @booking = Booking.find(params[:id])
    @booking.user_review = review_params[:user_review]
    @booking.user_rating = review_params[:user_rating]
    if @booking.save
      redirect_to bookings_path
    else
      render :add_review
    end
  end

  def update
   #a voir si on utilise la methode
   end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:booking_date, :user_id, :bar_id)
  end

  def review_params
    params.require(:booking).permit(:user_review, :user_rating)
  end
end
