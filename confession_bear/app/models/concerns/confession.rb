class Confession
	include Mongoid::Document
	field :confessions

	belongs_to :user
end