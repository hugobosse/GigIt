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
    @bar = bar.find(params[:bar_id])

  # we need `restaurant_id` to asssociate review with corresponding restaurant
    @bar = bar.find(params[:bar_id])
    @review.bar = @bar
    if @review.save
      redirect_to bookings_path
    else
      render :update
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:booking_date, :user_id, :bar_id)
  end

  def review_params
    params.require(:booking).permit(:user_review, :user_rating)
  end
end
