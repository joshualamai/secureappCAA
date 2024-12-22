class SessionsController < ApplicationController
  before_action :redirect_if_authenticated, only: [:new, :create]
  skip_before_action :verify_authenticity_token, only: :destroy

  def new
    # Renders login form
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      user.logs.create(action: "Login", details: "User logged in successfully.")
      redirect_to books_path, notice: "Logged in successfully!"
    else
      flash[:alert] = "Invalid email or password."
      render :new
    end
  end

  def destroy
    current_user.logs.create(action: "Logout", details: "User logged out successfully.") if current_user
    reset_session
    redirect_to login_path, notice: "Logged out successfully!"
  end
end
