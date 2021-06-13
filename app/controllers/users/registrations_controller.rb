# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :build_addresses, only: [:edit]

    def edit; end

    def update
      user_params[:email].present? ? update_email : update_password
    end

    def update_email
      current_user.update_without_password(user_params)
    end

    def user_params
      params.require(:user).permit(:email, :current_password, :password, :password_confirmation)
    end

    protected

    def update_resource(resource, params)
      params[:current_password] ? super : resource.update_without_password(params)
    end

    def after_update_path_for(_resource)
      edit_user_registration_path
    end

    private

    def build_addresses
      resource.build_billing_address if resource.billing_address.blank?
      resource.build_shipping_address if resource.shipping_address.blank?
    end
  end
end
