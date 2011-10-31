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
    response = {:success => 0}

    if buy == 'tickets'
      response = current_user.buy_prize 16, 'movie_tickets'
    elsif buy == 'massage'
      response = current_user.buy_prize 4, 'massages'
    elsif buy == 'sundae'
      response = current_user.buy_prize 8, 'sundaes'
    elsif buy == 'dinner'
      response = current_user.buy_prize 20, 'dinner'
    elsif buy == 'popcorn'
      response = current_user.buy_prize 4, 'popcorn'
    elsif buy == 'taxi'
      response = current_user.buy_prize 6, 'taxi'
    end

    render :json => response.to_json
  end

end
