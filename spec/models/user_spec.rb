# frozen_string_literal: true

RSpec.describe User do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end

  describe '.from_omniauth' do
    let(:auth) { OpenStruct.new(auth_data) }
    let(:auth_data) { stub_facebook_omniauth(email: user.email, uid: user.uid) }

    context 'when user already registered' do
      let(:user) { create(:user, :with_facebook) }

      it 'returns user' do
        expect(described_class.from_omniauth(auth)).to eq(user)
      end
    end

    context 'when new user' do
      let(:user) { build(:user) }

      it 'creates a new user' do
        expect { described_class.from_omniauth(auth) }.to change(described_class, :count).from(0).to(1)
      end
    end
  end

  describe 'abilities' do
    let(:admin) { AdminUser.new }
    let(:ability) { Ability.new(user) }
    let(:user) { create(:user) }

    context 'when is an user manager' do
      it 'read book' do
        expect(ability).to be_able_to(:read, Book.new(title: user))
      end
    end

    context 'when is an admin manager' do
      let(:admin) { create(:admin_user) }
      let(:ability) { Ability.new(admin) }

      it { expect(ability).to be_able_to(:create, Order) }
    end
  end
end
