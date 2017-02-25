require 'spec_helper'
require 'rails_helper'

feature 'makin goals' do
  user = User.create(username: 'ginger_baker', password: 'password')
  before(:each) do
    visit new_session_url
    fill_in 'Username', :with => "ginger_baker"
    fill_in 'Password', :with => "password"
    click_on "Sign On"
    click_on "Add Goal"
    fill_in 'Title', with: "Live Forever"
    fill_in 'Description', with: "Don't do drugs"
    check('Private')
    click_on "Submit Goal"
  end
  scenario 'has a new form' do
    expect(current_url).to eq(goals_url)
    expect(page).to have_content("Live Forever")
    expect(page).to have_content("Don't do drugs")
  end
end
