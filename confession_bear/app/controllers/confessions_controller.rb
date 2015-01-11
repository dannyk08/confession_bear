class ConfessionsController < ApplicationController
	before_filter :authorized?
	before_filter	:logged_in?
	def index
		@confessions = Confession.all 
	end

	def create
		@confession = @current_user.confessions.new(confession_params)
		# the top line does the same thing as the bottom ones
			# @confession = Confession.new(confession_params)
			# @confession.user = current_user 
		 if @confession.save
		 		redirect_to profile_path
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
		@comments = Comment.new
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
				flash.notice = "This confession can't be deleted"
			end
		redirect_to confessions_path
	end

	private

	def find_confession
			@confession = Confession.find(params[:id])
	end

	def confession_params
		params.require(:confession).permit(:title, :story, :reply)
	end

end
