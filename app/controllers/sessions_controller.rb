class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :destroy

  def new
    # Renders the login form
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      Rails.logger.info("User logged in with password: #{params[:password]}")
      redirect_to books_path, notice: "Logged in successfully!"
    else
      flash[:alert] = "Invalid email or password."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Logged out successfully!"
  end
end
