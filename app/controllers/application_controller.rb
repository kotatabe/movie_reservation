class ApplicationController < ActionController::Base
	helper_method :current_user
	include SessionsHelper
 
	private

		def current_user
			@current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
		end

		def login_required
			unless current_user
				store_location
				flash.now[:danger] = '予約にはログインが必要です'
				redirect_to login_path
			end
		end
end
