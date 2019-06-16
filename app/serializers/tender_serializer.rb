class TenderSerializer < ApplicationSerializer
  attributes :title, :category_name, :description, :user_login, :price, :expire_at, :created_at


  def user_login
    self.object.user.login
  end

  def category_name
    self.object.category.name
  end
end
