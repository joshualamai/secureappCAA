class SessionsController < ApplicationController
  # Skip CSRF verification only for the destroy action
  skip_before_action :verify_authenticity_token, only: :destroy

  def new
    # Render the login form
  end

  def create
    # Find the user by email
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      # Set session for logged-in user
      session[:user_id] = user.id

      # Log the login action
      user.logs.create!(action: "Login", details: "User logged in successfully.") rescue Rails.logger.error("Failed to log login action.")

      redirect_to books_path, notice: "Logged in successfully!"
    else
      flash.now[:alert] = "Invalid email or password."
      render :new
    end
  end

  def destroy
    if logged_in?
      # Log the logout action
      current_user.logs.create!(action: "Logout", details: "User logged out successfully.") rescue Rails.logger.error("Failed to log logout action.")

      # Clear the session
      session[:user_id] = nil
      redirect_to login_path, notice: "Logged out successfully!"
    else
      redirect_to login_path, alert: "You need to be logged in to log out."
    end
  end

  private

  def logged_in?
    session[:user_id].present?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end

