module ConfessionsHelper
	def all_confessions
		@confessions = Confessions.all
	end
end
