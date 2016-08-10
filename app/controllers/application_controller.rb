class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :get_location

  # Adding more flash types for bootstrap styling (defaults- :alert, :notice)
  add_flash_types :danger, :warning, :success, :validation_errors

  # Exclude page from displaying navbar - use: before_filter :disable_nav
  def disable_nav
    @disable_nav = true
  end

  # Check if admin is logged in 
  def logged_in?
    current_admin != nil
  end

  protected

  # Ensure the @location variable is loaded in all views
  def get_location
    if logged_in?
      @location = current_admin.location
    end
  end

end
