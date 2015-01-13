class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::Validations

  field :reply,  type: String

  validates :comment, presence: true

  belongs_to :confession#, inverse_of: :comments
  belongs_to :user
  # accepts_nested_attributes_for :user

  def date_added
      created_at.localtime.strftime("%-m/%-d/%Y | %l:%M %p")
  end
end
