class LocationsController < ApplicationController
  before_action :disable_nav, only: [:new]
  before_action :authenticate_admin!, only: [:new]
  before_action :set_location, only: [:edit, :update]
  before_action :access_denied

  def new
    @location = Location.new
  end

  def edit
  end

  # later successful create redirect will be changed to go to new plan page
  # erase these comments after changing redirect path
  def create
    @admin = current_admin
    @location = Location.new(location_params)

    if @location.save
      @admin.location_id = @location.id
      @admin.save
      flash[:success] = "Restaurant info successfully saved"
      redirect_to root_path
    else
      flash.now[:danger] = "Something went wrong and the restaurant info wasn't saved"
      render :new
    end
  end

  def update
    if @location.update(location_params)
      flash[:success] = "Restaurant info updated"
      redirect_to dashboard_path
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
