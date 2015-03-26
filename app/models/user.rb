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

  # attr_reader :current_password
  # def current_password=(unencrypted_password)
  #   unless unencrypted_password.empty?
  #     @current_password = unencrypted_password
  #     self.
      
  #   end

  # end
  
  validates :username, presence: true, uniqueness: true, case_sensitive: false, length: {within: 2..20}, on: :create
  validates :email,    presence: true, uniqueness: true, case_sensitive: false, length: { maximum: 50 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, on: :create
  validates :password, length: {within: 4..12}, presence: true, confirmation: true, on: :create#, :update]
  # validates :image, presence: true

  # carrierwave stuff
  mount_uploader :image, AvatarUploader
  
  has_many :confessions

  def comments 
    # self.username
    # @comments = Comment.where(username: self.username)

    # micah helped with this portion of the function to find comments
    # confessions.first.comments.where(:username => "Micah").to_a <-- original

    # @comments = confessions.first.comments.where(:username => self.username) <-- Daniel's attempt
  end

end
