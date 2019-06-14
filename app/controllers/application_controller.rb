class ApplicationController < ActionController::API
  include ActionController::Cookies
  include ActionController::RequestForgeryProtection

  # protect_from_forgery with: :exception

  class NotAuthorizedException < StandardError; end
  before_action :authenticate_user
  rescue_from NotAuthorizedException, with: -> { render json: { error: 'Not Authorized' }, status: 401 }

  def current_user
    @current_user
  end

  private

  def authenticate_user
    @current_user = User.find_by_id(session[:current_user_id])
    raise NotAuthorizedException unless @current_user
  end
end
