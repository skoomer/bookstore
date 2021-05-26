# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def facebook
      @user = User.from_omniauth(request.env['omniauth.auth'])

      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication
        if is_navigational_format?
          set_flash_message(:notice, :success,
                            kind: I18n.t('devise.omniauth_callbacks.facebook'))
        end
      else

        failure

      end
    end

    def failure
      set_flash_message(:alert, :failure, kind: I18n.t('devise.omniauth_callbacks.facebook'))
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end
end
