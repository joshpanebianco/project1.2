class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	 skip_before_action :verify_authenticity_token # You only need for handwritten forms.

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :username])
		devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username])
	end
end
