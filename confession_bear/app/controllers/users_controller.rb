class UsersController < ApplicationController
	
	def index
		@users = User.all
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to user_path(@user), notice: "You Signed Up! You're Awesome!"
		else
			render :new
		end
	end

	def new
		@user = User.new
	end

	def edit
		find_params
	end

	def show
		find_params
	end

	def update
		find_params
		if @user.update_attributes(user_params)
			redirect_to user_path
		else
			render :edit
		end		
	end

	def destroy
		find_params
			@user.destroy
		redirect_to users_path
	end

	private

	def find_params
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:email, :password, :username)
	end
end
