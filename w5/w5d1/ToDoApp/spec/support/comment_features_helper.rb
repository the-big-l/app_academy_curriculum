module CommentFeaturesHelper

  def make_ginger_baker
    User.create(username: 'ginger_baker', password: 'password')
  end

  def sign_on_ginger_baker
    visit new_session_url
    fill_in 'Username', :with => "ginger_baker"
    fill_in 'Password', :with => "password"
    click_on "Sign On"
  end

  def make_goals(user, goal_subject)
    Goal.create(
      title: "Awesomely #{goal_subject}",
      body: "Do: #{goal_subject}",
      private: 'false',
      completed: 'false',
      user_id: user.id
    )
  end

  def fill_comment_form(body)
    fill_in 'Comment', with: "#{body}"
    click_on "Add Comment"
  end
end
