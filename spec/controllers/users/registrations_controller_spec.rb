# frozen_string_literal: true

RSpec.describe Users::RegistrationsController do
  let(:user) { create(:user) }
  let(:password_new) { FFaker::String.from_regexp(User::PASSWORD_FORMAT_REGEX) }
  let(:address) { build(:address) }
  let(:address_empty) do
    { first_name: '', last_name: '', address: '', city: '', zip: '', country: '', phone_number: '' }
  end

  before do
    request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in user
  end

  describe 'GET #index' do
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

  describe '#email' do

    it 'send valid values' do
      post :update, params: { user: { email: FFaker::Internet.email } }
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#password' do
    
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

  describe '#address' do
    it 'send invalid values' do
      post :create, params: address_empty
      expect(response).to redirect_to(root_path)
    end

    it 'send valid values' do
      address.user_id = user.id
      post :create, params: address.attributes
      expect(response).to redirect_to(root_path)
    end
  end
end
