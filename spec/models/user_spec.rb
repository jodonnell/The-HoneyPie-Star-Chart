require 'spec_helper'

describe User do
  before(:each) do
    @user = User.new
    @user.stars = 0
    set_minimum
  end

  it 'should have an amount of stars' do
    @user.stars.should == 0
  end
  
  it 'should let you convert activities to stars' do
    @user.convert_activities_to_stars

    @user.stars.should == 4
    @user.yoga = 0
    @user.meditation = 0
    @user.gym = 0
  end

  it 'rewards extra stars for doing extra yoga' do
    @user.yoga = 2
    @user.convert_activities_to_stars
    @user.stars.should == 6
  end

  it 'rewards extra stars for doing extra meditation' do
    @user.meditation= 2
    @user.convert_activities_to_stars
    @user.stars.should == 5
  end

  it 'rewards extra stars for doing extra gym' do
    @user.gym = 2
    @user.convert_activities_to_stars
    @user.stars.should == 7
  end

  def set_minimum
    @user.yoga = 1
    @user.meditation = 1
    @user.gym = 1
  end



end
