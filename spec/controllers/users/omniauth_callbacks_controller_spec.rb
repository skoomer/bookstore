# frozen_string_literal: true

module Users
  RSpec.describe OmniauthCallbacksController do
    describe '#facebook' do
      let(:get_facebook) { get :facebook }
      let(:user) { create(:user) }

      before do
        stub_env_for_omniauth_fb
      end

      context 'when user success' do
        before do
          get_facebook
        end

        it { expect(response).to redirect_to(root_path) }
      end

      context 'when user failure' do
        before do
          stub_facebook_omniauth
          request.env['devise.mapping'] = Devise.mappings[:user]
          request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:facebook]
          get_facebook
        end

        it { expect(response).to redirect_to(new_user_registration_path) }
      end
    end
  end
end
