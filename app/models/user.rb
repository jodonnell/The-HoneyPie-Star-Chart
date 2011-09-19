class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :yoga, :gym, :meditation, :stars

  def convert_activities_to_stars
    if completed_minimum?
      self.stars += 4
      save
      reset_activities
    end
  end

  private
  def completed_minimum?
    yoga >= 1 and gym >= 1 and meditation >= 1
  end

  def reset_activities
    self.yoga = 0
    self.gym = 0
    self.meditation = 0
    save
  end
end
