class CommentsController < ApplicationController
	before_filter :authorized?
	before_filter	:logged_in?
	
	def index
		@comments = @confession.comments
	end
	def new
		@comment = @confession.comment.new
	end

	def create
		@confession = Confession.find(params[:confession_id])
		@comment = @confession.comment.new(comment_params)
		if @confession.save
			params[:notice] = "Comment created!"
			redirect_to confession_path(@confession)
		else
			render :new
		end
	end

	def destroy
		find_comment
		@comment.destroy
		redirect_to confessions_path
	end

	private

	def find_comment
		@comment = @confession.comment.find(params[:id])
	end

	def comment_params
		@comment = params.require(:comment).permit(:reply)
	end
end
