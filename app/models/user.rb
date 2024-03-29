class User < ApplicationRecord
  has_many :tenders
  has_many :proposals
  has_many :comments
  has_many :attachments

  def self.allowed_attributes
    %i(email password login)
  end
end
