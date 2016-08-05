class LocationsController < ApplicationController
  before_filter :disable_nav, only: [:new]
  before_action :set_location, only: [:edit, :update]

  def new
    @location = Location.new
  end

  def edit
  end

  def create
  end

  def update
  end

  private

  def location_params
    params.require(:location).permit(:restaurant_name, :address, :postal_code, :city, :state, :main_phone, :website, :position)
  end

  def set_location
    @location = Location.find(params[:id])
  end

end
