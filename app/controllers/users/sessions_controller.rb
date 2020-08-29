class Users::SessionsController < Devise::SessionsController
  skip_before_action :requested_url, only: %i[new create destroy]

  def new
    logger.info "Here is path: #{cookies[:return_to_url]}"
    logger.info "Here is user_id: #{cookies[:user_id]}"
    super
  end

  def create
    super
    logger.info "Here is path: #{cookies[:return_to_url]}"
    logger.info "Here is user_id: #{cookies[:user_id]}"
  end
end
