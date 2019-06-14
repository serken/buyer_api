class SessionController < ApplicationController
  skip_before_action :authenticate_user

  def sign_in
    user = User.where(email: session_params[:login], password: session_params[:password])
             .or(User.where(login: session_params[:login], password: session_params[:password])).first

    if user
      created_jwt = JWT.encode({ id: user.id }, nil, 'none')
      cookies.signed[:jwt] = { value: created_jwt, httponly: true, expires: 1.hour.from_now }
      render json: user
    else
      render json: { error: 'Invalid credentials' }, status: 401
    end
  end

  def destroy
    cookies.delete(:jwt)
  end

  private
  def session_params
    params.require(:session).permit(:login, :password)
  end
end
