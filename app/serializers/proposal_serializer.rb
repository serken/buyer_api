class ProposalSerializer < ApplicationSerializer
  attributes :text, :price, :created_at, :user_login

  def user_login
    self.object.user.login
  end
end
