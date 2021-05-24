# frozen_string_literal: true

module Users
  RSpec.describe OmniauthCallbacksController do
    let(:get_facebook) { get :facebook }

    context 'with default behaivor' do
      it 'was redirect status' do
        stub_env_for_omniauth_fb

        request.env['devise.mapping'] = Devise.mappings[:user]

        get_facebook
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'when user is new' do
      before do
        request.env['devise.mapping'] = Devise.mappings[:user]

        allow(User).to receive(:from_omniauth).and_return(build(:user))
        get_facebook
      end

      it { expect(response).to redirect_to(new_user_registration_path) }
    end

    context 'when user exist' do
      before do
        request.env['devise.mapping'] = Devise.mappings[:user]

        allow(User).to receive(:from_omniauth).and_return(create(:user))
        get_facebook
      end

      it { expect(response).to redirect_to(new_user_session_path) }
    end
  end
end
