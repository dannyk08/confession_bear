class CommentsController < ApplicationController
	before_filter :authorized?
	before_filter	:logged_in?
	
	def new
		@comments = Comment.new
	end

	def create
		confession = Confession.find(params[:confession_id])
		@comment = current_user.comment.new(comment_params)
		if @confession.save
			redirect_to confessions_path
		else
			render :new
		end
	end
	def edit
		
	end
	def update
		if find_comment
			comment_update_attributes(comment_params)
		else
			render :edit
		end
	end

	def destroy
		find_comment
		@comment.destroy
		redirect_to confessions_path
	end

	private

	def find_comment
		if session[:user_id] === current_user
			@comment = Comment.find(params[:id])
		end
	end

	def comment_params
		@comment = require.(:comment).permit(:reply)
	end
end
