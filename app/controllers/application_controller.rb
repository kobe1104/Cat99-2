class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def log_in(user)
    session[:session_token] = user.session_token
  end

  def log_out(user)
    user.reset_session_token!
    session[:session_token] = nil
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def log_in?
    if current_user
      redirect_to cats_url
    else
      render :new
    end
  end

  helper_method :current_user

end
