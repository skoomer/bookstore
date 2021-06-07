# frozen_string_literal: true

class SignIn < SitePrism::Page
  set_url '/users/sign_in'

  element :email_input, '#user_email'
  element :password_input, '#user_password'
  element :log_in_button, '#log_in_button'

  def visit_and_login_as(email, password)
    load
    email_input.set email
    password_input.set password
    log_in_button.click
  end
end
