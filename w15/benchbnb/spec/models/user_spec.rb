require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    before(:each) do
      User.create!(username: 'breakfast', password: 'password')
    end
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }

    it { should validate_uniqueness_of(:username) }

    it do
      should validate_length_of(:password).
        is_at_least(6).
        on(:create)
    end
  end

  describe 'associations' do
    it { should have_many(:favorites) }
    it { should have_many(:favorite_benches) }
  end
end
