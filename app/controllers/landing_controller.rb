class LandingController < ApplicationController
  before_action :access_denied, only: [:dashboard]

  def index
  end

  def dashboard
  end

end
