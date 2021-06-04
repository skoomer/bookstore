# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :store_user_location!, if: :storable_location?
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  include Pagy::Backend
  helper_method :categories
  protect_from_forgery
  
  def not_found
    render 'errors/404.html', layout: false, status: :not_found
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update) do |user|
      user.permit(
        :email,
        :password,
        :password_confirmation,
        :current_password,
        shipping_address_attributes: %i[first_name last_name address city zip country phone_number],
        billing_address_attributes: %i[first_name last_name address city zip country phone_number]
      )
    end
  end

  private

  def categories
    Rails.cache.fetch('all_categories') { Category.all }
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || super
  end

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
    store_location_for(:user, request.fullpath)
  end
end
