# frozen_string_literal: true

RSpec.describe User do
  describe 'with validation' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end

  describe '.from_omniauth' do
    let(:auth) { OpenStruct.new(auth_data) }
    let(:auth_data) { stub_facebook_omniauth(email: user.email, uid: user.uid) }

    context 'when user already registered' do
      let(:user) { create(:user) }

      it 'when returns user' do
        expect(described_class.from_omniauth(auth)).to eq(user)
      end
    end

    context 'when new user' do
      let(:user) { build(:user) }

      it 'creates a new user' do
        expect { described_class.from_omniauth(auth) }.to change(described_class, :count).by(1)
      end
    end
  end
end
