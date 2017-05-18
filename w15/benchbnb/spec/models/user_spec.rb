require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) do
    User.create!(username: 'breakfast', password: 'password')
  end

  let(:breakfast) do
    User.find_by_credentials('breakfast', 'password')
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

        it 'should be an instance of User' do
          expect(breakfast).to be_an_instance_of(User)
        end

        it 'should find the right user' do
          expect(breakfast.username).to eq('breakfast')
        end
      end

      context 'when given incorrect credentials' do
        let(:breakfast) do
          User.find_by_credentials('breakfast', 'pass')
        end
        it 'should return nil' do
          expect(breakfast).to be_nil
        end
      end
    end
  end

  describe 'instance_methods' do
    describe '#reset_session_token!' do
      it 'resets the session token' do
        old_token = breakfast.session_token
        new_token = breakfast.reset_session_token!
        expect(new_token).to_not eq(old_token)
      end
    end
  end
end
