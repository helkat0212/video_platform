class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  private
  def set_locale
    I18n.locale = session[:locale] || I18n.default_locale
  end

  def switch_locale
    new_locale = params[:locale].to_sym
    session[:locale] = new_locale if I18n.available_locales.include?(new_locale)
    redirect_back(fallback_location: root_path)
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
