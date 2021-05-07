# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  protect_from_forgery

  def not_found
    render 'error/404.html', layout: false, status: :not_found
  end

  private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
