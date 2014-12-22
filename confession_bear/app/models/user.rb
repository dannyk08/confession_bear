class User
  include Mongoid::Document
  field :username, type: String
  field :confessions, type: Integer

  has_many :confessions
end
