class Confession
	include Mongoid: :document
	field :confessions

	belongs_to :user
end