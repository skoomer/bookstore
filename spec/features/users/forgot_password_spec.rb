# frozen_string_literal: true

RSpec.describe ForgotPassword do
  let(:forgot_password) { described_class.new }

  before { forgot_password.load }

  it 'show form forgot password' do
    expect(forgot_password).to have_cancel_link
    expect(forgot_password).to have_forgot_title
    expect(forgot_password).to have_email_button
    expect(forgot_password).to have_user_email
    expect(forgot_password).to have_email_instriction
  end

  describe 'Click to email in button' do
    it 'Empty email and password' do
      forgot_password.email_button.click
      expect(forgot_password.alert_message.visible?).to eq(true)
    end
  end
end
