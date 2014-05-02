class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env['omniauth.auth'])

    session[:user] = user.id

    flash[:success] = "Welcome, #{current_user.user_name}!"
    redirect_to root_url
  end

  def destroy
    if current_user
      session.delete(:user)
      flash[:success] = 'See you!'
    else
      flash[:error] = 'You are not authorized!'
    end
    redirect_to root_url
  end
end