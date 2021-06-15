# frozen_string_literal: true

ActiveAdmin.register Delivery do
  permit_params :name, :time_shipping, :price
end
