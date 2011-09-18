require 'spec_helper'

describe HoneyPieController do
  render_views

  def sign_up
    visit '/users/sign_up'
    fill_in 'Email', :with => 'jacobodonnell@gmail.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_on 'Sign up'
  end

  it 'can display the amount of stars' do
    sign_up
    page.should have_content('You have 0 stars.')

    update_user_stars 1
    visit '/'
    page.should have_content('You have 1 star.')
  end

  def update_user_stars stars
    user = User.find_by_email('jacobodonnell@gmail.com')
    user.stars = stars
    user.save
  end

end
