# frozen_string_literal: true

class SignIn < SitePrism::Page
  set_url '/users/sign_in'

  element :facebook_icon, '.fa-facebook-official'
  element :email_input, '#user_email'
  element :password_input, '#user_password'
  element :log_in_button, 'input#log_in'
  element :sign_up_link, '#sign_up'
  element :alert_message, '#alert-message'
  element :user_email, '#user-email'

  def visit_and_login_as(email, password)
    load
    email_input.set email
    password_input.set password
    log_in_button.click
  end
end
