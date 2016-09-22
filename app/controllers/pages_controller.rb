class PagesController < ApplicationController

  def index
  end

  def dashboard
    @admin = @location.admin
    @users = User.all
  end

  def terms
  end

end
