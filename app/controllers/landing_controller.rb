class LandingController < ApplicationController

  def index
  end

  def dashboard
    @admin = @location.admin 
    @users = User.all
  end

end
