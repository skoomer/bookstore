# frozen_string_literal: true

RSpec.describe ForgotPassword do
  let(:forgot_password) { described_class.new }

  before { forgot_password.load }

  it { expect(forgot_password).to be_all_there }

  context 'when valid email' do
    let(:user) { create(:user) }
    let(:email) { user.email }

    before do
      forgot_password.forgot_email_form(email: email)
    end

    it 'redirects to user path' do
      expect(forgot_password).to have_current_path(new_user_session_path)
    end

    it 'sets success flash message' do
      expect(forgot_password).to have_success_flash_message
    end
  end

  context 'when invalid email' do
    let(:email) { FFaker::Internet.email }

    before do
      forgot_password.forgot_email_form(email: email)
    end

    it 'redirects to root path' do
      expect(forgot_password).to have_current_path(user_password_path)
    end

    it 'sets failure flash message' do
      expect(forgot_password).to have_error_message
    end
  end
end
