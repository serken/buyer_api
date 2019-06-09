class User < ApplicationRecord
  has_many :tenders
  has_many :proposals
  has_many :comments
  has_many :attachments

  alias :owner :user
end
