class ConfessionsController< ApplicationController
	def index
		@confessions = Confession.all
	end

	def show
		@confession = Confession.find(params[:id])
	end

	def new
		@confession = Confession.new
	end

	def create
		@confession = Confession.new(confession_params)
		if @confession.save
			redirect_to confessions_path
		else
			render "new"
		end

		def edit
			@confession = Confession.find(params[:id])
		end

		def update
			@confession = Confession.find(params[:id])
			if @confession.update_attributes(confession_params)
				redirect_to confessions_path
			else
				render "edit"
			end
		end

		def destroy
			@confession = Confession.find(params[:id])
			@confession.destroy
			redirect_to confessions_path
		end

		private
		def confession_params
			params.require(:confession).permit(:confessions)
		end
end
