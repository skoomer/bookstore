# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def facebook
      user = User.from_omniauth(request.env['omniauth.auth'])

      if user.persisted?
        sign_in_and_redirect user, event: :authentication
        success_flash_message if is_navigational_format?
      else
        session['devise.facebook_data'] = request.env['omniauth.auth']
        failure_flash_message
      end
    end

    private

    def failure_flash_message
      set_flash_message(:alert, :failure, kind: t('omniauth.facebook'))
      redirect_to new_user_registration_url
    end

    def success_flash_message
      set_flash_message(:notice, :success, kind: t('omniauth.facebook'))
    end
  end
end
