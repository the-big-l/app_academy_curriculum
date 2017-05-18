require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) do
    User.create!(username: 'breakfast', password: 'password')
  end

  describe 'validations' do
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

  describe 'model_methods' do
    describe '.find_by_credentials' do
      context 'when given correct credentials' do
        it 'should find the right user'
      end

      context 'when given incorrect credentials' do
        it 'should return nil'
      end
    end
  end
end
