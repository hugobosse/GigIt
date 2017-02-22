class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def home
    @last_bookings = Booking.order(booking_date: :desc).map { |booking| booking.bar }
    @last_booked_bars = @last_bookings.uniq
  end
end
