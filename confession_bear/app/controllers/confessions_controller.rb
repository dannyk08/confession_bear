class ConfessionsController < ApplicationController

	def index
		@confessions = Confession.all 
	end

	def create
		@confession = Confession.new(confession_params)
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
	end

	def show
		find_params
	end

	def update
		find_params
		if @confession.update_attributes(confession_params)
			redirect_to confessions_path
		else
			render :edit
		end
	end

	def destroy
		find_params
			@confession.destroy
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
