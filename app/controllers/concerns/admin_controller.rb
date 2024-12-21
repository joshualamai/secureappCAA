class AdminController < ApplicationController
  before_action :require_admin

  def dashboard
    # Logic for the admin dashboard
    @users = User.all
    @books = Book.all
  end

  private

  def require_admin
    unless current_user&.admin?
      redirect_to login_path, alert: "Unauthorized access!"
    end
  end
end
