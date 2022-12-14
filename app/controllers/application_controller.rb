class ApplicationController < ActionController::Base
  before_action :confirgure_permitted_parameters,if: :devise_controller?

  protected
  def confirgure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:email,:password,:password_confirmation,:username,:age,:interests)}
  end
end
