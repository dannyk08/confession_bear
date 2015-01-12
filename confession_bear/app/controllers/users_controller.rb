class UsersController < ApplicationController
	before_filter :authorized?, only: [:edit, :show, :update, :destroy]

	def index
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id.to_s
			# params[:notice] = "You've Signed up!  TESSSSTTTT"
			redirect_to profile_path(@user), notice: "You've Signed Up! You're Awesome!"
		else
			render :new
		end
	end

	def new
		@user = User.new
	end

	def edit
			if session[:user_id] === current_user
				@user = User.find(params[:id])
			end
	end

	def show
		@confessions = Confession.all
		@confession = Confession.new
		# @comments = Confession.comment.all
		# @comment = Confession.comment.new
		
	end

	def update
		find_user
  	# user = User.find_by_email(current_user.email).try(:authenticate, params[:current_password])
 		if current_user.update_attributes(user_params) # && user
   	  flash[:success] = "Profile updated"
    redirect_to root_path
  	else
	    # flash.now[:error] = "Incorrect Current Password" unless user
	    render :edit
	  end
	end

	def destroy
		find_user
		@user = current_user.destroy
		# if we delete a user.. then a session must be deleted as well?
		session.delete(:user_id)
		redirect_to root_path
	end

	private

	def find_user
		current_user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:email, :username, :image, :password, confessions_attributes: [:title, :story], comments_attributes: :reply)
	end
end
