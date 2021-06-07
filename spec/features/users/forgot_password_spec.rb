# frozen_string_literal: true

RSpec.describe ForgotPassword do
  let(:forgot_password) { described_class.new }
  let(:user) { create(:user) }
  let(:email) { FFaker::Internet.email }
  let(:home_page) { Home.new }

  before { forgot_password.load }

  it { expect(forgot_password).to be_all_there }

  it 'enter valid email' do
    forgot_password.forgot_email_form(user.email)
    expect(home_page).to have_current_path(new_user_session_path)
    expect(home_page).to have_div_success(text: I18n.t('devise.passwords.send_instructions'))
  end

  it 'enter invalid email' do
    forgot_password.forgot_email_form(email)
    expect(home_page).not_to have_selector 'div.alert.alert-danger',
                                           text: I18n.t('devise.failure.not_found_email',
                                                        authentication_keys: 'Email')
  end
end
