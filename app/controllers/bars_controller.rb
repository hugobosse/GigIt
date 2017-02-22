class BarsController < ApplicationController
  before_action :set_bar, only: [:show]


  def index
    @bars = Bar.all
    if params[:search]
      @bars = Bar.where("genre LIKE ?", params["search"["genre"]])
    else
      @bars = Bar.all
    end
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
