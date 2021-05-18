module Devise
  class UserController < Devise::RegistrationsController
    # before_action :authorize_resource, only: %i[index update]

    def edit
    end

    def update

      return update_password if params[:user][:current_password].present?
      return email if params.key?(:user)
    end

    def create
    end

    def update_password
      if @user.update_with_password(user_params_password)
        redirect_to root_path
        flash[:success] = t('settings.pass_changed')
      else
        flash[:warning] = @user.errors.full_messages.to_sentence
        render :edit
      end
    end

    def user_params_password
      params.require(:user).permit(:password, :current_password, :password_confirmation)
    end

    private

    def email
    current_user.update(email: params[:user][:email])
    end

    def email_exist?
      User.find_by(email: params[:quick_registrate][:email])
    end

    def respond_to_form(success)
      respond_to do |format|
        if success
          format.html { redirect_to user_path, flash: { notice: t('settings.successful_message') } }
        else
          format.js { render :edit, status: :unprocessable_entity }
        end
      end
    end

    def authorize_resource
      authorize current_user
    end
  end
end
