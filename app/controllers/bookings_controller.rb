class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
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

  def add_review
    @review = Review.new(review_params)
  # we need `restaurant_id` to asssociate review with corresponding restaurant
    @bar = bar.find(params[:bar_id])
    @review.bar = @bar
    if @review.save
      redirect_to bookings_path
    else
      render :add_review
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:booking_date, :user_id, :bar_id)
  end
end
