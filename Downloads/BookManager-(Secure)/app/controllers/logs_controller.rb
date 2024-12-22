class LogsController < ApplicationController
  before_action :require_login

  def index
    @logs = current_user.logs.order(created_at: :desc)
  end
end

