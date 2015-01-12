class Comment
  include Mongoid::Document
  include ActiveModel::Validations

  field :reply,  type: String

  embedded_in :confession, inverse_of: :comments
  # accepts_nested_attributes_for :user
end
