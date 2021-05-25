# # frozen_string_literal: true

# module Devise
#   class UserController < Devise::RegistrationsController
#     before_action :authenticate_user!
#     before_action :set_user

#     def edit; end

#     def update_password
#       if @user.update_with_password(user_params_password)
#         redirect_to root_path
#         flash[:success] = t('settings.pass_changed')
#       else
#         flash[:warning] = @user.errors.full_messages.to_sentence
#         render :edit
#       end
#     end

#     def update_email
#       @user.skip_reconfirmation!
#       if @user.update_without_password(user_params_email)
#         flash[:success] = t('devise.mailer.email_changed')
#       else
#         flash[:warning] = @user.errors.full_messages.to_sentence
#       end
#       redirect_to user_path
#     end

#     private

#     def user_params_password
#       params.require(:user).permit(:password, :current_password, :password_confirmation)
#     end

#     def user_params_email
#       params.require(:user).permit(:email)
#     end

#     def set_user
#       @user = current_user
#     end

#   end
# end
