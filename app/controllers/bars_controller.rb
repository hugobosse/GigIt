class BarsController < ApplicationController
  before_action :set_bar, only: [:show]
  skip_before_action :authenticate_user!, only: [:index, :show]


  def index
    @bars = Bar.search(params)
    @bars_geo = @bars.where.not( latitude: nil, longitude: nil )
    @hash = Gmaps4rails.build_markers(@bars_geo) do |bar_geo, marker|
      marker.lat bar_geo.latitude
      marker.lng bar_geo.longitude
    end
      #marker.infowindow render_to_string(partial: "/bars/map_box", locals: { bar: bar })
  end

  def show
    @booking = Booking.new
  end

  private

  def set_bar
    @bar = Bar.find(params[:id])
  end

  def bar_params
    params.require(:bar).permit(:name, :genre, :address, :price, :photo)
  end
end
