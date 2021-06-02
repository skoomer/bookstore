# frozen_string_literal: true

module Users
  RSpec.describe OmniauthCallbacksController do
    describe '#facebook' do
      let(:get_facebook) { get :facebook }
      let(:user) { create(:user) }

      context 'when user failure' do
        before do
          request.env['devise.mapping'] = Devise.mappings[:user]
          request.env['omniauth.auth'] = stub_facebook_omniauth(email: user.email)
          get_facebook
        end

        it { expect(response).to redirect_to(new_user_registration_path) }
      end

      context 'when user success' do
        let(:user) { create(:user, :with_facebook) }

        before do
          request.env['devise.mapping'] = Devise.mappings[:user]
          request.env['omniauth.auth'] = stub_facebook_omniauth(email: user.email, uid: user.uid)
          get_facebook
        end

        it { expect(response).to redirect_to(root_path) }
      end
    end
  end
end
