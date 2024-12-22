class ApplicationController < ActionController::Base
  before_action :set_current_user
  protect_from_forgery with: :exception

  private

  # Sets the current user for the session
  def set_current_user
    @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  # Checks if the user is logged in
  def logged_in?
    !!@current_user
  end
  helper_method :logged_in?, :current_user

  # Returns the current user
  def current_user
    @current_user
  end

  # Ensures a user is logged in before accessing a protected resource
  def require_login
    unless logged_in?
      redirect_to login_path, alert: "You must be logged in to access this section."
    end
  end

  # Redirects authenticated users from accessing pages meant for unauthenticated users
  def redirect_if_authenticated
    redirect_to books_path, notice: "You are already logged in!" if logged_in?
  end

  # Adds logging for access control events (e.g., unauthorized access attempts)
  def log_unauthorized_access
    Rails.logger.warn "Unauthorized access attempt to #{request.path} by user ID: #{session[:user_id]}"
  end
end
