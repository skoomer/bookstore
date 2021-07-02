# frozen_string_literal: true

module Users
  class PrivacyForm < SitePrism::Section
    element :title, '#privacy > h2', text: I18n.t('devise.registrations.edit.privacy')

    element :email_privacy_field, '#user_email'
    element :email_button, '#email_button'

    element :current_password_field, '#user_current_password'
    element :new_password_field, '#user_password'
    element :confirmation_password_field, '#user_password_confirmation'
    element :password_button, '#password_button'

    element :confirm_checkbox_to_remove, '#check_box'
    element :remove_account_button, '#remove_account_button'

    def fill_in(email)
      email_privacy_field.set email
      email_button.click
    end

    def update_email(email: '')
      email_privacy_field.set email
      email_button.click
    end

    def update_password(current_password: '', new_password: '')
      current_password_field.set current_password
      new_password_field.set new_password
      confirmation_password_field.set new_password
      password_button.click
    end

    def remove_account
      confirm_checkbox_to_remove.click
      remove_account_button.click
    end
  end
end
