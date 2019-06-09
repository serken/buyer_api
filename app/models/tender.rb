class Tender < ApplicationRecord
  has_many :comments, as: :commentable
  has_many :attachments, as: :attachable
  has_many :proposals
  belongs_to :user

  alias :owner :user

  def self.allowed_attributes
    %i(title)
  end
end
