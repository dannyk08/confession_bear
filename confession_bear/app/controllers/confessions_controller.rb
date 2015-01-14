class ConfessionsController < ApplicationController
	before_action :authorized?
	before_action	:logged_in?
	def index
		@confessions = Confession.all.order("date_confessed DESC")
		@confession = Confession.new
		@comments = Comment.all.order("date_added DESC")
		@comment = Comment.new
	end

	def create
		@confession = @current_user.confessions.new(confession_params)
		# @user.confession = current_user.confession
			# trying to let the user see an edit and delete button with these function
		# the top line does the same thing as the bottom ones
			# @confession = Confession.new(confession_params)
			# @confession.user = current_user 
		 if @confession.save
		 		redirect_to confession_path(@confession)
		 	else
		 		render :new
		 	end
	end

	def new
		@confession = Confession.new
	end

	def edit
		find_confession		
	end

	def show
		find_confession
		@comments = Comment.all.order("date_added DESC")
		@comment = Comment.new
		@comment = Comment.create
	end

	# I gotta fix this code so users can't edit stuff after 30 characters
	def update
		# unless current_user.confession.story.length < 20
			find_confession
			# flash.notice = "This confession can't be editted :/"
		if @confession.update_attributes(confession_params)
			redirect_to profile_path
		else
			render :edit
		end
	end

	def destroy
		find_confession
			if @confession.story.length <= 20
				@confession.destroy
			else
				flash[:notice] = "This confession can't be deleted"
			end
		redirect_to profile_path
	end

	# TO LIKE OR DISLIKE CONFESSIONS FROM OTHER USERS
	# MAYBE I COULD USE A TOGGLE FUNCTION
	# def like_confession
	# 	@confession.upvote_by @user
	# 	redirect_to confession_path(@confession)
	# end

	# def dislike_confession
	# 	@confession.downvote_from @user
	# 	redirect_to confession_path(@confession)
	# end
	private

	def find_confession
			@confession = Confession.find(params[:id])
	end
 
	def confession_params
		params.require(:confession).permit(:title, :story, comment: :reply)
	end

end
