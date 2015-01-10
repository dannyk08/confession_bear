class Comment
  include Mongoid::Document
  include ActiveModel::Validations
  
  field :reply, type: String

  belongs_to :user
  embedded_in :confession
end
