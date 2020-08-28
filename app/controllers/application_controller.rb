class ApplicationController < ActionController::Base
  before_action :requested_url
  before_action :authenticate_user!
  
  helper_method :current_user,
                :logged_in?

  private

  def authenticate_user!
    unless current_user
      redirect_to login_path, alert: 'Invalid Email or Password'
    end
  end

  def current_user
    @user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def requested_url
    cookies[:return_to_url] = request.url
    cookies[:user_id] = session[:user_id] if logged_in?
  end
end
