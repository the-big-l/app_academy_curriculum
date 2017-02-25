require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "New User"
  end

  feature "signing up a user" do
    before(:each) do
      visit new_user_url
      fill_in 'Username', :with => "leo"
      fill_in 'Password', :with => "i love biscuits"
      click_on "Submit"
    end

    scenario "shows username on the homepage after signup" do
      expect(page).to have_content "leo"
      expect(page).to have_content "Goals"
      expect(page).to have_button "Sign Out"
    end

  end

end

feature "logging in" do
  user = User.create(username: 'ginger_baker', password: 'password')

  before(:each) do
    visit new_session_url
    fill_in 'Username', :with => "ginger_baker"
    fill_in 'Password', :with => "password"
    click_on "Sign On"
  end

  scenario "shows username on the homepage after login" do
    expect(current_url).to eq(goals_url)
    expect(page).to have_content user.username
  end

end

feature "logging out" do
  user = User.create(username: 'ginger_baker', password: 'password')

  before(:each) do
    visit new_session_url
    fill_in 'Username', :with => "ginger_baker"
    fill_in 'Password', :with => "password"
    click_on "Sign On"
    click_on "Sign Out"
  end

  scenario "logs you out" do
    expect(current_url).to eq(new_session_url)

    expect(page).to have_content 'Please log on'
    expect(page).to have_button 'Sign On'
  end

  scenario "doesn't show username on the homepage after logout" do
    expect(page).not_to have_content user.username
  end

end
