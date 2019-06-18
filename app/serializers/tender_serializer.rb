class TenderSerializer < ApplicationSerializer
  attributes :title, :category_name, :description, :user_login, :price, :expire_at, :created_at

  has_many :proposals

  def user_login
    self.object.user.login
  end

  def category_name
    self.object.category.name
  end
end
