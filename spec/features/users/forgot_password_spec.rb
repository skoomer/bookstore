# frozen_string_literal: true

RSpec.describe ForgotPassword do
  let(:forgot_password) { described_class.new }
  let(:user) { create(:user) }

  before { forgot_password.load }

  it { expect(forgot_password).to be_all_there }

  it 'enter email' do
    forgot_password.forgot_email_form(user.email)
    expect(page).to have_current_path(new_user_session_path)
  end
end
