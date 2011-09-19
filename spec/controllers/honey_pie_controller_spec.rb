require 'spec_helper'

describe HoneyPieController do
  render_views

  before(:each) do 
    sign_up
  end


  def sign_up
    visit '/users/sign_up'
    fill_in 'Email', :with => 'jacobodonnell@gmail.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_on 'Sign up'
  end

  def user
    User.find_by_email 'jacobodonnell@gmail.com'
  end


  it 'can display the amount of stars' do
    page.should have_content('You have 0 stars.')

    update_user_stars 1
    visit '/'
    page.should have_content('You have 1 star.')
  end

  it 'will let you enter time' do
    fill_in 'Yoga', :with => '1'
    fill_in 'Gym', :with => '1'
    fill_in 'Meditation', :with => '1'
    click_on 'Submit'

    user.yoga.should == 1
    user.gym.should == 1
    user.meditation.should == 1
  end

  def update_user_stars stars
    me = user
    me.stars = stars
    me.save
  end

end
