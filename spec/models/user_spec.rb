# frozen_string_literal: true

RSpec.describe User do
  describe 'with validation' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end

  describe '#self.from_omniauth' do
    let(:auth_facebook) { OmniAuth.config.mock_auth[:facebook] }
    let(:user) { described_class.from_omniauth(auth_facebook) }

    it 'returns or cteate user' do
      expect(user.email).to eq(auth_facebook.info.email)
    end
  end
end
