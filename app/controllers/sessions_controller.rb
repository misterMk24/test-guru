class SessionsController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :requested_url
  
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      if current_user_in_cookie? && cookies[:return_to_url]
        redirect_to cookies[:return_to_url]
      else
        redirect_to tests_path
      end
    else
      flash.now[:alert] = 'Invalid Email or Password'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end

  private

  def current_user_in_cookie?
    current_user.id == cookies[:user_id].to_i || cookies[:user_id].nil?
  end
end
