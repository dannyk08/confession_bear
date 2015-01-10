class ConfessionsController < ApplicationController
	before_filter :authorized?
	after_filter	:logged_in?
	def index
		@confessions = Confession.all 
	end

	def create
		# @confession = current_user.confessions.new(confession_params)
		# the top line does the same thing as the bottom ones
			@confession = Confession.new(confession_params)
			@confession.user = current_user 
		 if @confession.save
		 		redirect_to confessions_path
		 	else
		 		render :new
		 	end
	end

	def new
		@confession = Confession.new
	end

	def edit
		find_params
		# I'm trying to prevent a user fro updating a confession down to <=30 to be able to delete it
		# if  @confession.story.length <= 30
		# 	flash.notice = "This confession can't be editted :/"
		# end
	end

	def show
		find_params
	end

	def update
		find_params
		if  @confession.story.length <= 30
			flash.notice = "This confession can't be editted :/"
		elsif @confession.update_attributes(confession_params)
			redirect_to confessions_path
		else
			render :edit
		end
	end

	def destroy
		find_params
			if @confession.story.length <= 30
				@confession.destroy
			else
				flash.notice = "This confession can't be deleted"
			end
		redirect_to confessions_path
	end

	private

	def find_params
		@confession = Confession.find(params[:id])
	end

	def confession_params
		params.require(:confession).permit(:title, :story)
	end
end
