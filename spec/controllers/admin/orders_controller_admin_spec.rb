# frozen_string_literal: true

RSpec.describe Admin::OrdersController do
  render_views
  let(:page) { Capybara::Node::Simple.new(response.body) }
  let(:current_user) { create(:admin_user) }
  let!(:order) { create(:order, :with_items) }
  let(:valid_attributes) { order.attributes }

  before { sign_in current_user }

  describe 'GET index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'assigns the orders' do
      get :index
      expect(assigns(:orders)).to include(order)
    end
  end

  describe 'GET edit' do
    before do
      post :create, params: { order: valid_attributes }
    end

    it 'change status' do
      expect(order).to transition_from(:in_progress).to(:canceled).on_event(:canceled)
      expect(order).to transition_from(:in_progress).to(:completed).on_event(:completed)
    end

    it 'status state' do
      expect(order).to have_state(:completed)
    end
  end
end