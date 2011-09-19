class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :yoga, :gym, :meditation, :stars

  def convert_activities_to_stars
    if completed_minimum?
      minimum_reward
      extra_rewards
    end

    reset_activities
    save
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
  end


  def completed_minimum?
    yoga >= 1 and gym >= 1 and meditation >= 1
  end

  def reset_activities
    self.yoga = 0
    self.gym = 0
    self.meditation = 0
  end
end
