class LandingController < ApplicationController
  before_action :access_denied, only: [:dashboard]

  def index
  end

  def dashboard
    @admin = current_admin
    @users = User.all 
  end

end
