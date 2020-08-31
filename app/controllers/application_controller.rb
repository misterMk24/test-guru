class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :requested_url
  before_action :authenticate_user!

  private

  def after_sign_in_path_for(resource)
    logger.info "Current user id: #{current_user.id}"
    
    if current_user.admin?
      stored_location_for(:user) || admin_tests_path
    else
      stored_location_for(:user) || root_path
    end
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end 

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation])
  end

  def requested_url
    store_location_for(:user, request.fullpath)
  end
end
