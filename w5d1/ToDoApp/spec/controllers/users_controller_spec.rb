require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "gets new template" do
    before(:each) {get :new}
    it {should render_template('new')}
  end

  describe "invalid credentials" do
    before {post :create, params: {user: {username: 'Dallas', password: '12345'}}}
    it { should render_template('new') }
    it { should set_flash[:errors] }
  end

  describe "valid credentials" do
    before {post :create, params: {user: {username: 'Leo', password: '123456'}}}
    it "does what it do" do
      expect(response).to redirect_to(goals_url)
      expect(:controller).to receive(:login!)
    end

  end
end
