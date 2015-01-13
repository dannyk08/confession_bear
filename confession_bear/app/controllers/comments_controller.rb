class CommentsController < ApplicationController
	before_filter :authorized?
	before_filter	:logged_in?
	
	def index
		@comments = @confession.comments.all("date_added DESC")
	end
	def new
		@comment = @confession.comment.new
	end

	def create
		@confession = Confession.find(params[:confession_id])
		@comment = confession.comments.create(comment_params)
		# @comment.user_id = current_user.id
		# @comment.confession_id = @post.id
		if @comment.save
			params[:notice] = "Comment created!"
			redirect_to confession_path(@confession)
			# redirect_to confession_path(comment.confession)
		else
			render :new
		end
	end

	def destroy
		@post = Confession.find(params[:confession_id])
		find_comment
		@comment.destroy
		redirect_to confession_path(@confession)
	end

	private

	def find_comment
		@comment = @confession.comment.find(params[:id])
	end

	def comment_params
		@comment = params.require(:comment).permit(:reply)
	end
end
