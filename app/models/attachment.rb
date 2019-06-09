class Attachment < ApplicationRecord
  belongs_to :user
  belongs_to :attachable, polymorphic: true

  alias :owner :user

  def self.allowed_attributes
    %i()
  end
end
