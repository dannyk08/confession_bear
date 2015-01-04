class User
  include Mongoid::Document

  field :email, type: String
  field :password, type: String
  field :username, type: String

  validates :email, presence: true, uniqueness: true, length: { maximum: 50 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: {minimum: 4, maximum: 12}
  validates :username, presence: true, uniqueness: true, length: {minimum: 3, maximum: 30}
end
