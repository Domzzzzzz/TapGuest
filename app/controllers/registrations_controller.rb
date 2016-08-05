class RegistrationsController < Devise::RegistrationsController

  def after_sign_up_path_for(resource)
   new_location_path 
  end

  private

# Devise strong params for accepting newly added params
# If a param isn't added here, it won't be saved to DB
  def sign_up_params
    params.require(:admin).permit(:email, :firstname, :lastname, :username, :password, :password_confirmation)
  end

# defining what admin params can be updated
  def account_update_params
    params.require(:admin).permit(:firstname, :lastname, :password, :password_confirmation, :current_password, :manager, :active)
  end

end
