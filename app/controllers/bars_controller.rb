class BarsController < ApplicationController
  before_action :set_bar, only: [:show]
  def index
    @bars = Bar.all
    @last_bookings = Booking.order(booking_date: :desc).map { |booking| booking.bar }
    @last_booked_bars = @last_bookings.uniq
  end

  def show
  end

  private

  def set_bar
    @bar = Bar.find(params[:id])
  end

  def bar_params
    params.require(:bar).permit(:name, :genre, :address, :price)
  end
end
