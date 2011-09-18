require 'spec_helper'

describe User do
  before(:each) do
    @user = User.new
    @user.stars = 0
  end

  it 'should have an amount of stars' do
    @user.stars.should == 0
  end
  
end
