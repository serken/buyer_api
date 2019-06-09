class Category < ApplicationRecord
  has_ancestry

  def self.allowed_attributes
    %i(name ancestry)
  end
end
