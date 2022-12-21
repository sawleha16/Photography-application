class ApplicationController < ActionController::Base
  before_action :confirgure_permitted_parameters, if: :devise_controller?

  protected

  def confirgure_permitted_parameters
    if action_name == 'create'
      devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:email, :password, :password_confirmation, :username, :age,:interests)}
    elsif action_name == 'update'
     devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:email, :password, :password_confirmation, :current_password, :username, :age, :interests)}
   end
  end
end
