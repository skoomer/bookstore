# frozen_string_literal: true

class SignUp < SitePrism::Page
  set_url '/users/sign_up'

  element :email_input, '#user_email'
  element :password_input, '#user_password'
  element :password_confirm_input, 'input#user_password_confirmation'
  element :sign_up_button, '#sign_up'
  element :success_flash_message, 'div.alert.alert-success', text: I18n.t('devise.registrations.signed_up')
  element :error_message, 'div.help-block'
  element :sign_up_link, 'a.sign_up_link'
  element :log_in_link, 'a.log_in_link'

  def visit_and_sign_up_as(email: '', password: '')
    load
    email_input.set email
    password_input.set password
    password_confirm_input.set password
    sign_up_button.click
  end

  expected_elements :sign_up_button, :password_input, :password_confirm_input, :email_input
end
