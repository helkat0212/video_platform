class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def after_sign_in_path_for(resource)
    home_path # or any other path you want to redirect to
  end
  

  protected
  def after_sign_in_path_for(resource)
    home_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:userName])
    devise_parameter_sanitizer.permit(:account_update, keys: [:userName])
  end
end
