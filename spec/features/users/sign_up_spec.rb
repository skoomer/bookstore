# frozen_string_literal: true

RSpec.describe SignUp do
  let(:sign_up) { described_class.new }
  let(:user) { build(:user) }

  before { sign_up.load }

  it { expect(sign_up).to be_all_there }

  describe 'validations' do
    it 'invalid values' do
      sign_up.sign_up_button.click
      expect(page).not_to have_selector 'div.alert.alert-success',
                                        text: I18n.t('devise.registrations.signed_up')
    end

    it 'signs up with valid values' do
      sign_up.visit_and_sign_up_as(user.email, user.password)
      expect(page).to have_current_path(root_path, ignore_query: true)
    end
  end
end
