class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :yoga, :gym, :meditation, :stars, :writing

  def self.convert_activities_to_stars
    all.each { |user| user.convert_activities_to_stars }
  end

  def convert_activities_to_stars
    if completed_minimum?
      minimum_reward
      extra_rewards
    end

    reset_activities
    save
  end

  def buy_prize stars_cost, prize
    response = {:success => 0}

    if stars >= stars_cost
      self.stars -= stars_cost
      send(prize + '=', send(prize) + 1)
      save

      response[:success] = 1
      response[:stars] = stars_cost
    end
    response

  end
  
  private
  def minimum_reward
    self.stars += 4
    self.yoga -= 1
    self.gym -= 1
    self.meditation -= 1
  end

  def extra_rewards
    self.stars += yoga * 2
    self.stars += gym * 3
    self.stars += meditation
    self.stars += writing * 3
  end


  def completed_minimum?
    yoga >= 1 and gym >= 1 and meditation >= 1
  end

  def reset_activities
    self.yoga = 0
    self.gym = 0
    self.meditation = 0
    self.writing = 0
  end
end
