# frozen_string_literal: true

class SignIn < SitePrism::Page
  set_url '/users/sign_in'

  element :email_input, '#user_email'
  element :password_input, '#user_password'
  element :log_in_button, '#log_in_button'
  element :success_flash_message, 'div.alert.alert-success', text: I18n.t('devise.sessions.signed_in')
  element :failure_flash_message, 'div.alert.alert-danger', text: I18n.t('devise.failure.not_found_in_database',
                                                                         authentication_keys: 'Email')

  def visit_and_login_as(email: '', password: '')
    load
    email_input.set email
    password_input.set password
    log_in_button.click
  end

  expected_elements :password_input, :log_in_button, :email_input
end
