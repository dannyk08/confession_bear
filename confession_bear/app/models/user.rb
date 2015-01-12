class User
  include Mongoid::Document
  include ActiveModel::Validations

  field :username,      type: String
  field :email,         type: String
  field :password_hash, type: String

  attr_reader :password
  def password=(unencrypted_password)
    unless unencrypted_password.empty?
      @password = unencrypted_password
      # users.password_hash in the database is a :string
      self.password_hash = BCrypt::Password.create(unencrypted_password)  
    end
  end

  def authenticate(unencrypted_password)
    if BCrypt::Password.new(self.password_hash) == unencrypted_password
      return self
    else
      return false
    end
  end
  
  validates :username, presence: true, uniqueness: true,        case_sensitive: false, length: {within: 2..20}
  validates :email,    presence: true, uniqueness: true,        case_sensitive: false, length: { maximum: 50 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, on: :create, length: {within: 4..12}, presence: true, confirmation: true
  # validates :password_confirmation, presence: true, on: :update, unless: lambda{|user| @user.password.blank? } 
    
  
  # carrierwave stuff
  mount_uploader :image, AvatarUploader
  
  has_many :confessions

end
