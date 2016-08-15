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

  # Prevents user with a host/hostess role from accessing certain pages.
  def access_denied
    if user_signed_in?
      if current_user.role == 'host' || current_user.role == 'hostess'
        redirect_to root_path
        flash[:warning] = "You must be an admin or manager to access"
      end
    end
  end

  protected

  # Ensure the @location variable is loaded in all views for admin
  def admin_get_location
    if admin_signed_in?
      @location = current_admin.location
    end
  end

  # Ensure the @location variable is loaded in all views for users
  def user_get_location
    if user_signed_in?
      @location = current_user.location
    end
  end

end
