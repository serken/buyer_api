class Attachment < ApplicationRecord
  belongs_to :user
  belongs_to :attachable, polymorphic: true

  alias :owner :user
end
