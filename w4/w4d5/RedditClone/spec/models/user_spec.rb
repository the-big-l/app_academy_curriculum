require 'rails_helper'

RSpec.describe User, type: :model do
  # validations
  context 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it 'should validate password is > 6 chars' do
      user = User.new(username: 'leo', password: 'pass')
      user.valid?
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'should allow password that is > 6 chars' do
      user = User.new(username: 'leo', password: 'password')
      user.valid?
      expect(user.errors.full_messages).not_to include("Password is too short (minimum is 6 characters)")
    end
  end

  context 'associations' do
    it { should have_many(:subs) }
  end
end
