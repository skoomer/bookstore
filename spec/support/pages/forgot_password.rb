# frozen_string_literal: true

class ForgotPassword < SitePrism::Page
  set_url '/users/password/new'

  element :forgot_title, 'h1'
  element :email_instriction, 'p'
  element :user_email, '#user_email'
  element :email_button, 'input#email_button'
  element :cancel_link, 'a'
  element :email_input, 'input#user_email'

  def forgot_email_form(email)
    load
    email_input.set email
    email_button.click
  end
end
