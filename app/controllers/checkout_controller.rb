# frozen_string_literal: true

class CheckoutController < ApplicationController
  include Wicked::Wizard

  steps :login

  def show
    if current_order.order_items.empty? && !current_user && step != :login
      redirect_to root_path
    else
      render_wizard
    end
  end

  def update
    update_manager

    redirect_to next_wizard_path
  end
end
