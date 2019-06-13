class SessionController < ApplicationController
  class InvalidCredentialsException < StandardError; end

  skip_before_action :authenticate_user
  rescue_from InvalidCredentialsException, with: -> { render json: { error: 'Invalid credentials' }, status: 401 }

  def sign_in
    user = User.where(email: session_params[:login], password: session_params[:password])
             .or(User.where(login: session_params[:login], password: session_params[:password])).first

    if user
      session[:current_user_id] = user.id
      render json: user
    else
      raise InvalidCredentialsException
    end
  end

  def session_params
    params.require(:session).permit(:login, :password)
  end
end
