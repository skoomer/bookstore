# frozen_string_literal: true

RSpec.describe 'Signup' do
  let(:sign_up) { SignUp.new }
  let(:home_page) { Home.new }
  let(:user) { build(:user) }

  before { sign_up.load }

  it 'Show form `Sign up`' do
    expect(sign_up).to have_facebook_icon
    expect(sign_up).to have_email_input
    expect(sign_up).to have_password_input
    expect(sign_up).to have_password_confirm_input
    expect(sign_up).to have_sign_up_button
  end

  describe 'Click to Sign up button' do
    it 'Empty email and password' do
      sign_up.sign_up_button.click
      expect(sign_up.email_invalid_feedback.visible?).to eq(true)
    end
  end

  describe 'Click valid values' do
    before do
      sign_up.visit_and_sign_up_as(user.email, user.password)
    end
  end
end
