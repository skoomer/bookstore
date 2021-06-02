# frozen_string_literal: true

RSpec.describe SignUp do
  let(:sign_up) { described_class.new }
  let(:user) { build(:user) }
  let(:home_page) { Home.new }

  before { sign_up.load }

  it { expect(sign_up).to be_all_there }

  describe 'validations' do
    it 'signs up with invalid data' do
      sign_up.sign_up_button.click
      expect(home_page).not_to have_selector 'div.alert.alert-success',
                                             text: I18n.t('devise.registrations.signed_up')
    end

    it 'signs up with valid data' do
      sign_up.visit_and_sign_up_as(user.email, user.password)
      expect(home_page).to have_current_path(root_path, ignore_query: true)
      expect(home_page).to have_div_success(text: I18n.t('devise.registrations.signed_up'))
    end

    it 'hide links sign_up and log_in after success' do
      sign_up.visit_and_sign_up_as(user.email, user.password)
      expect(home_page).not_to have_link('a.sign_up_link')
      expect(home_page).not_to have_link('a.log_in_link')
    end
  end
end
