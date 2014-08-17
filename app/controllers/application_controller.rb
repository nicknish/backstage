class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # Authorizes that non-users cannot access certain views
  def authorize
   redirect_to root_path, alert: "Not authorized" if current_user == nil
  end

  # Login from any view
  def login
    @user_login = User.new
    @is_login = true
  end
  # Signup from any view
  def new
    @user_signup = User.new
    @is_signup = true
  end

end
