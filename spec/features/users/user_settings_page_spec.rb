# frozen_string_literal: true

RSpec.describe Users::UserSettingsPage do
  let(:settings_page) { described_class.new }
  let(:user_attributes) { attributes_for(:user) }
  let(:user) { create(:user) }

  before do
    login_as(user)
    settings_page.load
  end

  context 'when update profile' do
    let(:home_page) { Home.new }
    let(:new_email) { user_attributes[:email] }

    before do
      settings_page.user_privacy_link.click
    end

    it 'renders success flash message' do
      settings_page.privacy_form.remove_account
      expect(settings_page).to have_success_flash_message
    end

    it 'updates email' do
      settings_page.privacy_form.update_email(email: new_email)
      expect(settings_page).to have_success_flash_message
      expect(home_page).to have_email_header(text: new_email)
    end

    it 'updates password' do
      settings_page.privacy_form.update_password(current_password: user.password,
                                                 new_password: user.password.reverse)
      expect(settings_page).to have_success_flash_message
    end
  end

  describe 'addresses' do
    let(:billing_address) { create(:address, :with_billing_address) }
    let(:shipping_address) { create(:address, :with_shipping_address) }

    it 'updates billing address' do
      visit edit_user_registration_path
      settings_page.billing_address.fill_in_billing_address billing_address
      expect(settings_page).to have_success_flash_message
    end

    it 'updates shipping address' do
      settings_page.shipping_address.fill_in_shipping_address shipping_address
      expect(settings_page).to have_success_flash_message
    end
  end
end
