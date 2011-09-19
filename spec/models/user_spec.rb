require 'spec_helper'

describe User do
  before(:each) do
    @user = User.new
    @user.stars = 0
  end

  it 'should have an amount of stars' do
    @user.stars.should == 0
  end
  
  it 'should let you convert activities to stars' do
    @user.yoga = 1
    @user.meditation = 1
    @user.gym = 1

    @user.convert_activities_to_stars

    @user.stars.should == 1
    @user.yoga = 0
    @user.meditation = 0
    @user.gym = 0
  end

end
