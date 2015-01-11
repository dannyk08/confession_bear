class Comment
  include Mongoid::Document
  include ActiveModel::Validations
  
  field :reply, type: String

  embedded_in :confession
  # accepts_nested_attributes_for :user
end
