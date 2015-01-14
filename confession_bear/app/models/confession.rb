class Confession
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::Validations

  field :title, type: String
  field :story, type: String
  # field :date_created, type: Date

  validates :title, presence: true
  validates :story, presence: true, length: { minimum: 20}, on: :update

  #COULD BE USEFUL FOR HANDLING/VALIDATING IMAGES IN CONFESSIONS
  # has_attached_file :image, styles: { medium: "700x500#", small: "350x250#" }
  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  belongs_to :user
  # deletes all the comments withing that confession so there are no "loose ends"
  embeds_many :comments#, dependent: :destroy

  def date_confessed
      created_at.localtime.strftime("%A, %B %-d, %Y at %l:%M %p")
  end
end
