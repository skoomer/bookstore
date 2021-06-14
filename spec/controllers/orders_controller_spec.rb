# frozen_string_literal: true

RSpec.describe OrdersController do
  let(:current_user) { create(:user) }
  let(:order) { create(:order, :with_items, user: current_user) }

  before do
    sign_in current_user
  end

  describe 'GET #index' do
    before do
      get :index, format: 'text/html'
    end

    it 'returns a 204 OK status' do
      expect(response).to have_http_status(:no_content)
    end
  end
end
