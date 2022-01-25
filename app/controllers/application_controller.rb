class ApplicationController < ActionController::Base
  # add_flash_types :info, :error, :warning, :success
  # helper_method :current_user
	# def authenticate_user
	# 	unless current_user
	# 		redirect_to login_path, alert: "You don't have access to this page"
	# 	end
	# end
	
	# def current_user
	# 	return nil unless session[:current_user_id]
	# 	@current_user ||= User.find(session[:current_user_id])
	# end
end