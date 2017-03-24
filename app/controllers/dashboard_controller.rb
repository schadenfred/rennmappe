class DashboardController < ApplicationController

  layout false
  def show
    @user = current_user
  end

  def index

  end
end
