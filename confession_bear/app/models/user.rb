class User
  include Mongoid::Document
  field :username, type: String
  field :story_num, type: Integer

  has_many :confessions
end
