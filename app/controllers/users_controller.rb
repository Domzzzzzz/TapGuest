class UsersController < Devise::RegistrationsController
  before_action :access_denied, only: [:new, :edit]

  #Overriding Devise create method
  def create
    @location = Location.find(params[:id])
    resource.location_id = @location.id 
    super
  end

  private

  # Devise strong params for accepting newly added params
  # If a param isn't added here, it won't be saved to DB
  def sign_up_params
    params.require(:user).permit(:firstname, :lastname, :username, :password, :password_confirmation, :role)
  end

  # defining what user params can be updated
  def account_update_params
    params.require(:user).permit(:firstname, :lastname, :password, :email, :role, :active)
  end

end
