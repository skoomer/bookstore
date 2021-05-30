# frozen_string_literal: true

RSpec.describe SignIn do
  let(:sign_in) { described_class.new }
  let(:user) { create(:user) }

  before { sign_in.load }

  it { expect(sign_in).to be_all_there }

  describe 'validations' do
    it 'invalid values' do
      sign_in.log_in_button.click
      expect(page).not_to have_selector 'div.alert.alert-danger',
                                        text: I18n.t('devise.failure.not_found_in_database',
                                                     authentication_keys: 'Email')
    end

    it 'redirects to root_path if valid login' do
      sign_in.visit_and_login_as(user.email, user.password)
      expect(page).to have_current_path(root_path, ignore_query: true)
    end
  end
end
