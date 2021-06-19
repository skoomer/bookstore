# frozen_string_literal: true

RSpec.describe Users::RegistrationsController do
  let(:user) { create(:user) }
  let(:password_new) { FFaker::String.from_regexp(User::PASSWORD_FORMAT_REGEX) }

  before do
    request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in user
  end

  describe '#edit' do
    before do
      get :edit
    end

    it 'renders the index template' do
      expect(response).to render_template(:edit)
    end

    it 'returns status 200' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'update email' do
    it 'returns redirect status' do
      post :update, params: { user: { email: FFaker::Internet.email } }
      expect(response).to have_http_status(:redirect)
    end
  end

  describe 'update password' do
    let(:password_params) do
      { user: { current_password: user.password, password_confirmation: password_new, password: password_new } }
    end

    before { put :update, params: password_params }

    it 'returns status response' do
      expect(response).to have_http_status(:found)
    end

    it 'redirect to users edit' do
      expect(response).to redirect_to edit_user_registration_path
    end

    it 'send valid values' do
      post :update, params: { password_form: { current_password: user.password,
                                               password: password_new,
                                               password_confirmation: password_new } }

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'create user address' do
    let(:address) { attributes_for(:address) }
    let(:address_empty) do
      { first_name: '', last_name: '', address: '', city: '', zip: '', country: '', phone_number: '' }
    end

    it 'redirect to root_path if params invalid' do
      post :create, params: address_empty
      expect(response).to redirect_to(root_path)
    end

    it 'redirect to root_path if params valid' do
      post :create, params: address
      expect(response).to redirect_to(root_path)
    end
  end
end
