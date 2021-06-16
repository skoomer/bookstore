# frozen_string_literal: true

RSpec.describe OrderItemsController do
  let!(:book) { create(:book) }
  let(:order_item_new) { build(:order_item, book: create(:book)) }
  let(:order_item) { create(:order_item) }
  let(:user) {create(:user)}

  describe 'POST #create' do
    let(:create_params) { { order_item: { book_id: book.id, quantity: 1 } } }

    before { post :create, xhr: true, params: create_params }

    it 'assign order_item' do
      expect(assigns(:order_item)).not_to be_nil
    end

    it { expect(response).to have_http_status :ok }
  end

  # describe 'PATCH #update' do
  #   context 'when input correct value' do
  #     it 'returns a 302 status' do
  #       patch :update, format: 'js', params: { id: order_item.id, order_item: order_item.attributes }
  #       expect(response).to have_http_status(:found)
  #     end
  #   end
  # end

  describe 'POST #update' do
    let(:create_params) { { order_item: { book_id: book.id, quantity: 1 } } }
    let!(:book) { create(:book) }


    it 'assign order_item' do
      # binding.pry
      patch :update , params: { quantity: order_item.quantity}
      # expect(response).to have_http_status(:found)
      expect(response).to redirect_to(root_path)

    end

    it { expect(response).to have_http_status :ok }
  end
end
