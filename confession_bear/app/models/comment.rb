class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::Validations

  field :reply,  type: String
  field :username, type: String

  validates :reply, presence: true, on: :create

  embedded_in :confession
  accepts_nested_attributes_for :confession

  def date_added
    created_at.localtime.strftime("%-m/%-d/%Y | %l:%M %p")
  end
end
