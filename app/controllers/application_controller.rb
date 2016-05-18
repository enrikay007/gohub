class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_paramters, if: :devise_controller?

  protected
  	def configure_permitted_paramters
  		devise_parameter_sanitizer.for(:sign_up) << :fullname << :date_of_birth
  		devise_parameter_sanitizer.for(:account_update) << :fullname << :description << :email << :password << :live_in << :gender << :current_password << :date_of_birth << :avatar
  	end
end
