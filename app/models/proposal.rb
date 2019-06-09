class Proposal < ApplicationRecord
  has_many :comments, as: :commentable
  has_many :attachments, as: :attachable
  belongs_to :tender
  belongs_to :user

  alias :owner :user

  def self.allowed_attributes
    %i(text)
  end
end
