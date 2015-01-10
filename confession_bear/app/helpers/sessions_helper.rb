module SessionsHelper
	def current_user
		if session[:user_id]
			@current_user ||= User.find(session[:user_id])
		end
	end

	def logged_in?
		session[:user_id] != nil
	end
	
	def authorized?
    unless (current_user != nil) && (current_user != session[:user_id])
      redirect_to signup_path
    end
  end
	
end
