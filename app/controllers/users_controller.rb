class UsersController < ApplicationController
  skip_before_action :requested_url
  skip_before_action :authenticate_user!
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to tests_path
      session[:user_id] = @user.id
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
