class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected

  def after_sign_in_path_for(current_user)
    current_user.admin? ? admin_adminpanel_index_path : root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :last_name])
  end

end
