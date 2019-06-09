class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  def self.allowed_attributes
    %i(message)
  end
end
