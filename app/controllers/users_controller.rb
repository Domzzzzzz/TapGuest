class UsersController < ApplicationController
  before_action :access_denied, only: [:new, :edit]
  before_action :set_user, only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    @user.location_id = @location.id

    if @user.save
      flash[:success] = "New user successfully added"
      redirect_to dashboard_path
    else
      flash[:danger] = "Something went wrong and the user wasn't added"
      render :new
    end
  end

  def update
    # If no password provided, disregard these params
    if user_params[:password].blank?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
    end

    # Only update password if a new password is provided
    successfully_updated = if needs_password?(@user, user_params)
                             @user.update(user_params)
                           else
                             @user.update_without_password(user_params)
                           end

    if successfully_updated
      flash[:success] = "User successfully updated"
      redirect_to dashboard_path
    else
      flash[:danger] = "Something went wrong and the user wasn't updated"
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:notice] = "User successfully deleted"
      redirect_to dashboard_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :username, :email, :password, :password_confirmation, :role, :active)
  end

  def set_user
    @user = User.find(params[:id])
  end

  # Check if password is entered in the field on the edit page
  # Only if password is provided, the user's password will change
  def needs_password?(user, params)
    params[:password].present?
  end

end
