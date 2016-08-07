class LocationsController < ApplicationController
  before_filter :disable_nav, only: [:new]
  before_action :set_location, only: [:edit, :update]

  def new
    @location = Location.new
  end

  def edit
  end

  # later successful create redirect will be changed to go to new plan page
  # erase these comments after changing redirect path
  def create
    @location = Location.new(location_params)

    if @location.save
      flash[:success] = "Restaurant info successfully saved"
      redirect_to root_path
    else
      flash.now[:danger] = "Something went wrong and the restaurant info wasn't saved"
      render :new
    end
  end

  # later successful redirect will be changed to go to dashboard page
  # erase these comments after changing redirect path
  def update
    if @location.update(location_params)
      flash[:success] = "Restaurant info updated"
      redirect_to root_path
    else
      flash.now[:danger] = "Something went wrong and the restaurant info wasn't updated"
      render :edit
    end
  end

  private

  def location_params
    params.require(:location).permit(:restaurant_name, :address, :postal_code, :city, :state, :main_phone, :website, :position)
  end

  def set_location
    @location = Location.find(params[:id])
  end

end
