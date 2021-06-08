# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :store_user_location!, if: :storable_location?
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  include Pagy::Backend
  helper_method :categories
  protect_from_forgery
  helper_method :current_order
  
  def not_found
    render 'errors/404.html', layout: false, status: :not_found
  end

  def current_order
    @current_order ||= set_current_order
    @current_order = @current_order.in_progress? ? @current_order : set_current_order
  end

  def set_current_order
    if current_user.present?
      order = current_user.orders.in_progress.first_or_create
      order.coupon = session_order.coupon if session_order.coupon
      order.order_items << session_order.order_items
      return order
    end
    session_order
  end

  def session_order
    order = Order.find_by(id: session[:current_order_id])
    return order if order.present?

    order = Order.create
    session[:current_order_id] = order.id
    order
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
