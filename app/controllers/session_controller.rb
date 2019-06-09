class SessionController < ApplicationController
  class InvalidCredentialsException < StandardError; end

  skip_before_action :authenticate_user
  rescue_from InvalidCredentialsException, with: -> { render json: { error: 'Invalid credentials' }, status: 401 }

  def sign_in
    user = User.where(email: params[:email], password: params[:password])
             .or(User.where(login: params[:email], password: params[:password])).first
    if user
      session[:current_user_id] = user.id
    else
      raise InvalidCredentialsException
    end
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
