# frozen_string_literal: true

class ForgotPassword < SitePrism::Page
  set_url '/users/password/new'

  element :forgot_title, 'h1'
  element :email_instriction, 'p'
  element :user_email, '#user_email'
  element :email_button, 'input#forgot_password'
  element :cancel_link, 'a'
  element :alert_message, '#alert-message'
end
