# frozen_string_literal: true

module Users
  RSpec.describe OmniauthCallbacksController do
    describe '#facebook' do
      let(:get_facebook) { get :facebook }

      before do
        stub_env_for_omniauth_fb
      end

      context 'when user is new' do
        before do
          allow(User).to receive(:from_omniauth).and_return(build(:user))
          get_facebook
        end

        it { expect(response).to redirect_to(new_user_registration_path) }
      end

      context 'when user exist' do
        before do
          allow(User).to receive(:from_omniauth).and_return(create(:user))
          get_facebook
        end

        it { expect(response).to redirect_to(root_path) }
      end
    end
  end
end
