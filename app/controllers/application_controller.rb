class ApplicationController < ActionController::Base
  helper_method :current_cart
  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_cart
    session[:cart] ||= {}
  end

  def add_breadcrumb(name, url = '')
    @breadcrumbs ||= []
    @breadcrumbs << { name: name, url: url }
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name address province_id])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name address province_id])
  end
end
