class CommentsController < ApplicationController
	before_action :authorized?
	before_action	:logged_in?
	
	def index
		@comments = @confession.comments.all("date_added DESC")
	end
	def new
		@comment = @confession.comments.new
	end

	def create
		@confession = Confession.find(params[:confession_id])
		@comment = @confession.comments.create(comment_params)
		@comment[:username] = current_user[:username]
		if @comment.save
			params[:notice] = "Comment created!"
			redirect_to confession_path(@confession)
			# redirect_to confession_path(comment.confession)
		else
			render :new
		end
	end

	def destroy
		@confession = Confession.find(params[:confession_id])
		find_comment
		@comment.destroy
		redirect_to confession_path(@confession)
	end

	private

	def find_comment
		@comment = @comment.find(params[:id])
	end

	def comment_params
		params.require(:comment).permit(:reply)
	end
end
