class Tender < ApplicationRecord
  has_many :comments, as: :commentable
  has_many :attachments, as: :attachable
  has_many :proposals
  belongs_to :user
  belongs_to :category

  before_create :set_expire_at

  alias :owner :user

  def self.allowed_attributes
    %i(title description category_id price)
  end

  private
  def set_expire_at
    self.expire_at = Time.current + 7.days
  end
end
