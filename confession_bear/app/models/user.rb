require 'bcrypt'

class User
  include Mongoid::Document

  has_secure_password

  attr_accessible :email, :password, :password_confirmation, :username

  field :username, type: String
  field :email, type: String
  field :password, type: String
  field :password_confirmation, type: String
  
  validates :username, presence: true, uniqueness: true, length: {within: 3..30}
  validates :email, presence: true, uniqueness: true, case_sensitive: false, length: { maximum: 50 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: {within: 4..12}
  


  # users.password_hash in the database is a :string
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
