class LogsController < ApplicationController
  before_action :require_user

  def index
    @logs = current_user.logs.order(created_at: :desc)
  end

  private

  def require_user
    unless logged_in?
      redirect_to login_path, alert: "You must be logged in to view logs."
    end
  end

  def logged_in?
    session[:user_id].present?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
