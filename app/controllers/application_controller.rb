class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :get_location

  # Adding more flash types for bootstrap styling (defaults- :alert, :notice)
  add_flash_types :danger, :warning, :success, :info, :validation_errors

  # Exclude page from displaying navbar - use: before_filter :disable_nav
  def disable_nav
    @disable_nav = true
  end

  # Prevents user with a host/hostess role from accessing certain pages.
  def access_denied
    if user_signed_in?
      if current_user.role == 'Host' || current_user.role == 'Hostess'
        redirect_to :back
        flash[:warning] = "Admin & Manager access only"
      end
    end
  end

  # Prevents Managers & Hosts/Hostesses from accessing subscription pages.
  def admin_only
    unless admin_signed_in?
      redirect_to :back
      flash[:warning] = "Admin access only"
    end
  end

  protected

  # Ensure the @location variable is loaded in all views
  def get_location
    if admin_signed_in?
      @location = current_admin.location
    end

    if user_signed_in?
      @location = current_user.location
    end
  end

end
