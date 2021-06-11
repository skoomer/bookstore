# frozen_string_literal: true

RSpec.describe Users::UserSettingsPage do
  let(:settings_page) { described_class.new }
  let(:user) { create(:user) }

  before do
    login_as(user, scope: :user)
    settings_page.load
  end

  context 'when update profile' do
    before do
      settings_page.user_privacy_link.click
    end

    it 'remove account user' do
      settings_page.privacy_form.remove_account
      expect(settings_page).to have_flash_success
      expect(User.where(id: user.id)).not_to exist
    end

    it 'update email' do
      settings_page.privacy_form.update_email(email: user.email)
      User.where(id: user.id)
      expect(settings_page).to have_flash_success
    end

    it 'update password' do
      settings_page.privacy_form.update_password(current_password: user.password,
                                                 new_password: user.password.reverse)
      expect(settings_page).to have_flash_success
    end
  end

  context 'when enter billing address' do
    let(:billing_address) { create(:address, :billing_address) }
    let(:shipping_address) { create(:address, :shipping_address) }

    it 'save billing address' do
      settings_page.billing_address.initialize_billing_address billing_address
      expect(settings_page).to have_flash_success
    end

    it 'save shipping address' do
      settings_page.shipping_address.initialize_shipping_address shipping_address
      expect(settings_page).to have_flash_success
    end
  end
end
