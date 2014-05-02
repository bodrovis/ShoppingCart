module ApplicationHelper
  def current_user
    auth_cookie = session[:user]
    user = User.find_by_id(auth_cookie.to_i)
    if auth_cookie && user
      user
    else
      false
    end
  end
end
