class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  #attr_accessor :login
 

  protected

    def configure_permitted_parameters
       devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username,:mobile_no,:email,:password, :password_confirmation, :remember_me) }
       devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password,:mobile_no,:remember_me) }
       devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :mobile_no,:password, :password_confirmation, :current_password) }
    end 

end
