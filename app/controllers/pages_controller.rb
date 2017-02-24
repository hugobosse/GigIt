class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def home
    @last_booked_bars = Bar.joins(:bookings).group('bars.id, bookings.booking_date').order('bookings.booking_date DESC').to_a.uniq
  end
end
