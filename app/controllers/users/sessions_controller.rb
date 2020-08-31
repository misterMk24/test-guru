class Users::SessionsController < Devise::SessionsController
  skip_before_action :requested_url
  
  def create
    super
    flash[:notice] = "Welcome, User #{current_user.username}" if current_user.sign_in_count == 1
  end
end
