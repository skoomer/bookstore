# frozen_string_literal: true

RSpec.describe Users::RegistrationsController do
  let(:user) { create(:user) }

  before do
    request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in user
  end

  describe '#edit' do
    before do
      get :edit
    end

    it 'renders the edit template' do
      expect(response).to render_template(:edit)
    end

    it 'returns status 200' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#action' do
    before { put :update, params: params }

    describe 'success' do
      let(:params) do
        { user: { email: FFaker::Internet.email } }
      end

      it { expect(response).to redirect_to(edit_user_registration_path) }
    end

    describe 'failure' do
      let(:params) do
        { user: { email: FFaker::Name.first_name } }
      end

      it { expect(response).to render_template(:edit) }
    end
  end

  describe 'update password' do
    let(:password_new) { FFaker::String.from_regexp(User::PASSWORD_FORMAT_REGEX) }

    before { put :update, params: password_params }

    context 'when success' do
      let(:password_params) do
        { user: { current_password: user.password, password_confirmation: password_new, password: password_new } }
      end

      it { expect(response).to redirect_to(edit_user_registration_path) }
    end

    context 'when failure' do
      let(:password_params) do
        { user: { current_password: user.password, password_confirmation: password_new, password: nil } }
      end

      it { expect(response).to render_template(:edit) }
    end
  end

  describe 'create user address' do
    let(:address) { attributes_for(:address) }

    context 'when success' do
      before { post :create, params: address }

      let(:address) { attributes_for(:address) }

      it { expect(response).to redirect_to(root_path) }
    end

    context 'when failure' do
      before { post :create, params: address_empty }

      let(:address_empty) do
        { first_name: '', last_name: '', address: '', city: '', zip: '', country: '', phone_number: '' }
      end

      it { expect(response).to redirect_to(root_path) }
    end
  end

  describe 'update address' do
    let(:address) { attributes_for(:address) }

    context 'when success' do
      before { put :update, params: address }

      let(:address) { attributes_for(:address) }

      it { expect(response).to redirect_to(edit_user_registration_path) }
    end

    context 'when failure' do
      before { put :edit, params: address_empty }

      let(:address_empty) do
        { first_name: '', last_name: '', address: '', city: '', zip: '', country: '', phone_number: '' }
      end

      it { expect(response).to render_template(:edit) }
    end
  end
end
