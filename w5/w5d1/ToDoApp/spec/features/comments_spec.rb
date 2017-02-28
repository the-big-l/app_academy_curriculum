require 'spec_helper'
require 'rails_helper'
# require ''

feature 'makin comments on gaols' do
  before(:each) do
    user = make_ginger_baker
    sign_on_ginger_baker
    make_goals(user, "Go to the Park")
  end

  scenario 'on goal page, comment form is present' do
    visit goal_url(Goal.last)
    expect(page).to have_button("Add Comment")
  end

  scenario 'make a comment' do
    visit goal_url(Goal.last)
    fill_comment_form("These are GOALD!!")
    expect(current_url).to eq(goal_url(Goal.last))
  end

  scenario 'see your new comment' do
    fill_comment_form("These are GOALD!!")
    fill_comment_form("I wish other people would comment on this, besides me... :(")
    fill_comment_form("...so lonely... ...\n...")

    expect(page).to have_content("These are")
    expect(page).to have_content("I wish other")
    expect(page).to have_content("so lonely")
  end

  scenario 'can remove comments' do
    fill_comment_form("...so lonely... ...\n...")

    expect(page).to have_content("so lonely")

    click_link 'Remove Comment'

    expect(page).not_to have_content("so lonely")
  end

  scenario 'see other comments'
end
