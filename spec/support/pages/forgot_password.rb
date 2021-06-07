
# frozen_string_literal: true

class ForgotPassword < SitePrism::Page
  set_url '/users/password/new'

  element :forgot_password_title, 'h1', text: I18n.t('devise.passwords.new.forgot_password')
  element :email_instructions_title, 'p', text: I18n.t('devise.passwords.new.instructions_message')
  element :user_email, '#user_email'
  element :email_button, '#email_button'
  element :cancel_link, 'a', text: I18n.t('devise.passwords.new.cancel')
  element :email_input, '#user_email'
  element :success_flash_message, 'div.alert.alert-success', text: I18n.t('devise.passwords.send_instructions')
  element :error_message, 'div.help-block'

  def forgot_email_form(email: '')
    load
    email_input.set email
    email_button.click
  end

  expected_elements :forgot_password_title, :email_instructions_title,
                    :user_email, :email_button, :cancel_link, :email_input
end
