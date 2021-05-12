# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Rectify::ControllerHelpers
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  helper_method :categories
  protect_from_forgery

  def not_found
    render 'errors/404.html', layout: false, status: :not_found
  end

  private

  def categories
    Rails.cache.fetch('all_categories') { Category.all }
  end
end
