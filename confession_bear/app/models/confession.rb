class Confession
  include Mongoid::Document
  field :title, type: String
  field :story, type: String
  # field :date_created, type: Date

  validates :title, presence: true
  validates :story, presence: true, length: { minimum: 10}

  belongs_to :user
  embeds_many :comments
end
