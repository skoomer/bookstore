# frozen_string_literal: true

RSpec.describe OrderItemsController do
  let!(:book) { create(:book) }
  let(:order) { create(:order) }
  let(:order_item) { create(:order_item, order: order) }
  let(:order_item_params) { { book_id: book.id, quantity: 1 } }

  describe 'POST #create' do
    let(:create_params) { { order_item: { book_id: book.id, quantity: 1 } } }

    before { post :create, xhr: true, params: create_params }

    it 'assign order_item' do
      expect(assigns(:order_item)).not_to be_nil
    end

    it { expect(response).to have_http_status :ok }
  end

  describe '#update' do
    before do
      allow(controller).to receive(:current_order).and_return(order)
      put :update, params: { id: order_item.id, order_item: order_item_params }
    end

    def action
      put :update, params: { id: order_item.id, order_item: order_item_params }
    end

    it 'redirects to root_path' do
      action
      expect(response).to redirect_to(root_path)
    end

    it 'increase order_item quantity by 2' do
      order_item_params[:quantity] = 2
      expect { action }.to change { order_item.reload && order_item.quantity }.by(2)
    end
  end

  describe 'delete' do
    before do
      allow(controller).to receive(:current_order).and_return(order)
    end

    it 'redirect to root_path' do
      delete :destroy, params: { id: order_item.id, order_item: order_item_params }
      expect(response).to redirect_to(root_path)
    end
  end
end
