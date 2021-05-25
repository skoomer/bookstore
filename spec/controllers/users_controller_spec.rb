# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController do
  let(:user) { create(:user) }

  before do
    user.confirm
    sign_in(user) 
  end

  context 'when PATCH update_email' do
    let(:email_params) do
      { user: { email: user.email } }
    end

    before do 
      
      put :update_email, params: email_params 
    
    end

    it 'returns redirect response' do
      expect(response).to have_http_status(:found)
    end

    it 'flash success' do
      expect(response).to redirect_to(settings_path(assigns(:users)))

      expect(flash[:success]).to eq I18n.t('devise.email_changed')
    end
  end

  context 'when PATCH update password' do
    let(:password_params) do
      { user: { current_password: user.password, password_confirmation: 'NewPassword1', password: 'NewPassword1' } }
    end

    before { put :update_password, params: password_params }

    it 'returns redirect response' do
      expect(response).to have_http_status(:found)
      
    end

    it 'redirect_to  users' do
      expect(response).to redirect_to root_path
    end

    it 'flash success' do
      expect(flash[:success]).to eq I18n.t('devise.pass_changed')
    end
  end

  
end
