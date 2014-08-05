class DashboardController < ApplicationController

  def index
    @users = User.where.not(id: current_user.id)
    @user = current_user
  end

end