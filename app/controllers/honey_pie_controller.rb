class HoneyPieController < ApplicationController
  before_filter :authenticate_user!
  def index
    @user = current_user
  end

  def enter_time
    user = current_user
    user.update_attributes params[:user]
    redirect_to root_path
  end

end
