# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  protect_from_forgery

  def not_found
    render 'error/404.html', layout: false, status: :not_found
  end

  private
  def user_not_authorized
    flash[:alert] = t('.not_authorized')
    redirect_path = request.url.eql?(checkout_email_login_url) ? checkout_path : root_path
    redirect_to(redirect_path)
  end

  def after_sign_in_path_for(_resource_or_scope)
    case request.referrer
    when checkout_email_login_url then checkout_path
    else
      root_path
    end
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
