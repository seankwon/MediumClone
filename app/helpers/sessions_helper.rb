module SessionsHelper
  def sign_in(user)
    cookies[:auth_token] = user.auth_token
    current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user
    @current_user ||= User.find_by auth_token: cookies[:auth_token]
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user?(user)
    user == current_user
  end

  def sign_out
    current_user = nil
    cookie.delete[:auth_token]
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to login_path, error: "Log in please"
    end
  end

  def correct_user
    unless current_user?(User.find_by id: params[:id])
      store_location
      redirect_to login_path, error: "Wrong user"
    end
  end

end
