class BarsController < ApplicationController
  before_action :set_bar, only: [:show]

  skip_before_action :authenticate_user!, only: [:index, :show]

  def new
    @bar = Bar.new
  end

  def create
    @bar = Bar.new(bar_params)
    @bar.user = current_user
    if @bar.save
      #BarMailer.creation_confirmation(@bar).deliver_now
      redirect_to @bar, notice: 'Get ready to host gigs a bar'
    else
      render :new
    end
  end

  def index
    @bars = Bar.search(params)
    @bars_geo = @bars.where.not( latitude: nil, longitude: nil )
    @hash = Gmaps4rails.build_markers(@bars_geo) do |bar_geo, marker|
      marker.lat bar_geo.latitude
      marker.lng bar_geo.longitude
      marker.picture(url: ActionController::Base.helpers.asset_path("pin.png"), width:  32, height: 32)
      marker.infowindow render_to_string(partial: "/bars/map_box", locals: { bar: bar_geo })
    end
  end

  def show
    @booking = Booking.new
    @bar_geo = @bar
    @hash = Gmaps4rails.build_markers(@bar_geo) do |bar_geo, marker|
      marker.lat bar_geo.latitude
      marker.lng bar_geo.longitude
      marker.picture(url: ActionController::Base.helpers.asset_path("pin.png"), width:  32, height: 32)
      marker.infowindow render_to_string(partial: "/bars/map_box", locals: { bar: bar_geo })
    end
  end

  private

  def set_bar
    @bar = Bar.find(params[:id])
  end

  def bar_params
    params.require(:bar).permit(:name, :genre, :address, :price, :photo, :capacity, :description)
  end
end
