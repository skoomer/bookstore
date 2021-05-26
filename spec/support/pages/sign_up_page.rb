# frozen_string_literal: true

class SignUp < SitePrism::Page
  set_url '/users/sign_up'

  element :email_input, 'input#user_email'
  element :password_input, 'input#user_password'
  element :password_confirm_input, 'input#user_password_confirmation'
  element :sign_up_button, 'input#sign_up'

  def visit_and_sign_up_as(email, password)
    load
    email_input.set email
    password_input.set password
    password_confirm_input.set password
    sign_up_button.click
  end
end
