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

  def buy
    buy = params[:what]
    if current_user.stars >= 20
      current_user.stars -= 20
      current_user.save
    end
    redirect_to root_path
  end


end
