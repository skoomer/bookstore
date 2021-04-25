# frozen_string_literal: true
require 'factory_bot_rails'

if Rails.application.config.seeds_enabled
  20.times do
    FactoryBot.create :book, :attach_author
  end
end
