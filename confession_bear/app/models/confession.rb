class Confession
	include Mongoid::Document
	field :story, type: String

	belongs_to :user
end