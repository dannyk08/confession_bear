class UsersController < ApplicationController
	def index
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id.to_s
			redirect_to user_path(@user), notice: "You've Signed Up! You're Awesome!"
		else
			render :new
		end
	end

	def new
		@user = User.new
	end

	def edit
		@user = User.find(params[:id])
	end

	def show
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to root_path
		else
			render :edit
		end		
	end

	def destroy
		find_params
			@user.destroy
		redirect_to root_url
	end

	private

	def find_params
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:email, :username, :image, :password)
	end
end
