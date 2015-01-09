class SessionsController < ApplicationController
  
  def new #not neccessary to implement any code 
  end

  def create
  	user = User.where(email: params[:login][:email]).first
  	if user && user.authenticate(params[:login][:password])
  		session[:user_id] = user.id.to_s
  		redirect_to user_path, notice: "Logged in!"
  	else
  		redirect_to login_path
  	end
  end

  def destroy
  	session.delete(:user_id)
  	redirect_to root_url, notice: "Hope you feel better :)"
  end
end
