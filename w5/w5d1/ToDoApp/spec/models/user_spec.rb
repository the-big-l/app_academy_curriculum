# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  session_token   :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:username)}
    it {should validate_presence_of(:password_digest)}
    it {should validate_presence_of(:session_token)}
    it {should validate_length_of(:password).is_at_least(6)}
  end

  describe 'associations' do
    it {should have_many(:goals)}
    it {should have_many(:cheers)}
    it {should have_many(:comments)}
  end

  describe 'class methods' do
    before(:each) { user = User.create(username: 'Leo', password: '123456')}
    it "finds by credentials" do
      expect(User.find_by_credentials(username: 'Leo', password: '123456')).to be_instance_of(User)
      expect(User.find_by_credentials(username: 'Leo', password: '123456').username).to eq('Leo')
    end
  end
end
