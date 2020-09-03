class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
    	user_path(resource)
	end

  	protected

  	def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    	#nameカラムを追加したから？devise_parameter_sanitizer.permitって何のこと？
    	devise_parameter_sanitizer.permit(:account_update, keys: [:name, :introduction])
  	end

end
