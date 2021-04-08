# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Pages', type: :request do
  describe 'GET /index' do
    before { get '/pages/index' }

    it 'return status 200' do
      expect(response.status).to eq 200
    end
  end
end
