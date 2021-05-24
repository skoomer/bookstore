# frozen_string_literal: true

class SignUp < SitePrism::Page
  set_url '/users/sign_up'

  element :facebook_icon, '.fa-facebook-official'
  element :email_input, '#user_email'
  element :password_input, '#user_password'
  element :password_confirm_input, '#user_password_confirmation'
  element :sign_up_button, '#sign_up'
  element :email_invalid_feedback, '.email > .invalid-feedback'
  element :user_email, '#user-email'

  def visit_and_sign_up_as(email, password)
    load
    email_input.set email
    password_input.set password
    password_confirm_input.set password
    sign_up_button.click
  end
end
