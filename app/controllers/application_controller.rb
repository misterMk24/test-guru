class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :requested_url
  before_action :authenticate_user!
  before_action :set_locale

  def default_url_options
    { lang: I18n.locale }
  end

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

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
