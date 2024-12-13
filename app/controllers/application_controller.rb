class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nick_name, :first_name, :last_name, :read_first, :read_last, :birth_day])
  end
end

def basic_auth
  authenticate_or_request_with_http_basic do |user_name, password|
    user_name == 'kabuki' && password == '0009'
  end
end
