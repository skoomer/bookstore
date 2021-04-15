# frozen_string_literal: true

RSpec.describe 'Pages', type: :request do
  describe 'GET /index' do
    before { get root_path }

    it 'return status 200' do
      expect(response.status).to eq 200
    end
  end
end
