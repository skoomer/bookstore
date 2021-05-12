# frozen_string_literal: true

module Users
  RSpec.describe OmniauthCallbacksController do
    describe 'GET auth/facebook/callback' do
      before do
        valid_facebook_login_setup
        request.env['devise.mapping'] = Devise.mappings[:user]
        request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:facebook]
        get :facebook
      end

      it 'sets user_id' do
        expect(session['warden.user.user.key'].flatten.first).to eq(User.last.id)
      end

      it 'redirects to root' do
        expect(response).to redirect_to(root_path)
      end
      
    end

    # describe 'anonymus' do
  

    #   it 'sets user_id' do
    #     get :facebook
    #     expect(session[:user_id]).to eq(User.last.id)
    #   end

    #   it 'redirects to root' do
    #     get :facebook
    #     expect(response).to redirect_to root_path
    #   end
      
    # end
  end
end
