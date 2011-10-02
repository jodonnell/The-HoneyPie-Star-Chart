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
      if current_user.stars >= 16
        current_user.stars -= 16
        current_user.movie_tickets += 1
        current_user.save
        response[:success] = 1
        response[:stars] = 16
      end
    elsif buy == 'massage'
      if current_user.stars >= 4
        current_user.stars -= 4
        current_user.massages += 1
        current_user.save
        response[:success] = 1
        response[:stars] = 4
      end
    elsif buy == 'sundae'
      if current_user.stars >= 8
        current_user.stars -= 8
        current_user.sundaes += 1
        current_user.save
        response[:success] = 1
        response[:stars] = 8
      end
    elsif buy == 'dinner'
      if current_user.stars >= 20
        current_user.stars -= 20
        current_user.dinner += 1
        current_user.save
        response[:success] = 1
        response[:stars] = 20
      end
    end

    render :json => response.to_json
  end


end
