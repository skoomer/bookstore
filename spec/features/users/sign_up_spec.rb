# frozen_string_literal: true

RSpec.describe SignUp do
  let(:sign_up) { described_class.new }

  before { sign_up.load }

  it { expect(sign_up).to be_all_there }

  context 'when signup valid data' do
    let(:user) { build(:user) }

    before do
      sign_up.visit_and_sign_up_as(email: user.email, password: user.password)
    end

    it 'redirects to root path' do
      expect(sign_up).to have_current_path(root_path, ignore_query: true)
    end

    it 'sets success flash message' do
      expect(sign_up).to have_success_flash_message
    end

    it 'hides links sign_up and log_in after success' do
      expect(sign_up).not_to have_sign_up_link
      expect(sign_up).not_to have_log_in_link
    end
  end

  context 'when invalid password or email' do
    before do
      sign_up.visit_and_sign_up_as
    end

    it 'redirects to root path' do
      expect(sign_up).to have_current_path(user_registration_path)
    end

    it 'sets failure flash message' do
      expect(sign_up).to have_error_message
    end

    it 'enter valid email and password' do
      sign_up.email_input.set user.email
      sign_up.password_input.set user.password
      sign_up.password_confirm_input.set user.password
      sign_up.sign_up_button.click
      expect(sign_up.user_email.text).to eq(user.email)
    end
  end

  describe 'Click valid values' do
    before do
      sign_up.visit_and_sign_up_as(user.email, user.password)
    end
  end
end
